#!/usr/bin/env ruby
require 'fileutils'
require 'securerandom'

class ExcelRecalculator
  def initialize(folder_path)
    @folder_path = folder_path
    @temp_dir = File.join(@folder_path, "temp_#{SecureRandom.hex(4)}")
  end

  def recalculate_files(pattern = "*.xlsx")
    files = Dir.glob(File.join(@folder_path, pattern))

    if files.empty?
      puts "No Excel files found in #{@folder_path}"
      return
    end

    begin
      # 一時ディレクトリを作成
      FileUtils.mkdir_p(@temp_dir)

      files.each do |file|
        puts "Processing: #{file}"
        begin
          # バックアップを作成
          backup_file = "#{file}.bak"
          FileUtils.cp(file, backup_file)

          # 一時ディレクトリに出力
          command = "soffice --headless --calc --recalc --convert-to xlsx:'Calc MS Excel 2007 XML' --outdir #{@temp_dir} #{file}"
          result = system(command)

          if result
            # 一時ファイルから元の場所に移動
            temp_file = File.join(@temp_dir, File.basename(file))
            if File.exist?(temp_file)
              FileUtils.mv(temp_file, file, force: true)
              FileUtils.rm(backup_file)
              puts "Successfully recalculated: #{file}"
            else
              puts "Error: Output file not found"
              FileUtils.mv(backup_file, file)
            end
          else
            puts "Error processing file: #{file}"
            FileUtils.mv(backup_file, file)
          end
        rescue => e
          puts "Error: #{e.message}"
          # エラーの場合はバックアップから復元
          FileUtils.mv(backup_file, file) if File.exist?(backup_file)
        end
      end

    ensure
      # 一時ディレクトリの削除
      FileUtils.rm_rf(@temp_dir) if Dir.exist?(@temp_dir)
    end
  end
end

# 使用例
folder_path = "excel"  # 実際のパスに変更してください
calculator = ExcelRecalculator.new(folder_path)
calculator.recalculate_files

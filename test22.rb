require 'fileutils'

class ExcelRecalculator
  def initialize(folder_path)
    @folder_path = folder_path
  end

  def recalculate_files(pattern = "*.xlsx")
    files = Dir.glob(File.join(@folder_path, pattern))

    if files.empty?
      puts "Excelファイルが #{@folder_path} に見つかりません"
      return
    end

    files.each do |file|
      puts "処理中: #{file}"
      begin
        # バックアップを作成
        backup_file = "#{file}.bak"
        FileUtils.cp(file, backup_file)

        # LibreOfficeのコマンド
        command = "soffice --headless --calc --convert-to xlsx:\"Office Open XML Spreadsheet\" --outdir \"#{File.dirname(file)}\" \"#{file}\""
        result = system(command)

        if result
          FileUtils.rm(backup_file)
          puts "再計算成功: #{file}"
        else
          puts "ファイル処理エラー: #{file}"
          FileUtils.mv(backup_file, file)
        end
      rescue => e
        puts "エラー: #{e.message}"
        FileUtils.mv(backup_file, file) if File.exist?(backup_file)
      end
    end
  end
end

folder_path = "excel"  # Excelファイルがあるフォルダのパス
calculator = ExcelRecalculator.new(folder_path)
calculator.recalculate_files

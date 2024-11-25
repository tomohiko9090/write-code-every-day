require 'aws-sdk-s3'
require 'securerandom'

class ExcelUploader
  class << self
    def upload(file)
      # ファイル名は 'ランダム文字列_タイムスタンプ.xlsx' とする
      file_name = "#{SecureRandom.urlsafe_base64(9)}_#{Time.current.strftime('%Y%m%d%H%M%S')}.xlsx"
      # バケット直下のexcelという名前のフォルダ配下に出力する
      file_full_path = "excel/#{file_name}"

      if Rails.env.development?
        # 開発環境ではローカルに保存
        File.open(Rails.root.join('tmp', file_name), 'wb') do |f|
          f.write(file.read)
        end
      else
        # S3クライアントのインスタンス作成
        s3 = Aws::S3::Client.new
        # S3にExcelファイルを出力
        s3.put_object(
          bucket: ENV['AWS_S3_BUCKET'],
          key: file_full_path,
          body: file.read,
          content_type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
        )
      end
    end
  end
end

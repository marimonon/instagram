class ApplicationMailer < ActionMailer::Base
  default from: 'nozomi.masujima@gmail.com'      # 送信元メールアドレス
  layout 'mailer'                       # メール全体に適用されるメールフォーム（Viewsのapplication.html.hamlなどと共通の原理かと）
end

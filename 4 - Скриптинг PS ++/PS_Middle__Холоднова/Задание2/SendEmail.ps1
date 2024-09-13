# Настройки SMTP
$smtpServer = "smtp.yandex.com"
$smtpPort = 25
$smtpUser = "holodnowaanna@yandex.ru"
$smtpPassword = "oekfmbwalaqyskkw"

# Параметры письма
$from = "holodnowaanna@yandex.ru"
$to = "annkholodnova@gmail.com"
$subject = "Тест отправки письма"
$body = "Это тестовое письмо, отправленное с помощью PowerShell."

# Создаем объект электронной почты
$message = New-Object System.Net.Mail.MailMessage
$message.From = $from
$message.To.Add($to)
$message.Subject = $subject
$message.Body = $body

# Создаем объект SMTP-клиента
$smtp = New-Object System.Net.Mail.SmtpClient($smtpServer, $smtpPort)
$smtp.EnableSsl = $true
$smtp.Credentials = New-Object System.Net.NetworkCredential($smtpUser, $smtpPassword)

# Отправляем письмо
$smtp.Send($message)
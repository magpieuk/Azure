ExceptionNotification::Notifier.exception_recipients = %w(irvingld@gmail.com)
ExceptionNotification::Notifier.sender_address =%("Application Error" <app.error@azure.heroku.com>)
ExceptionNotification::Notifier.email_prefix = "[AZURE] "

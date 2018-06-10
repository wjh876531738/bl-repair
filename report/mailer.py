import smtplib
from email.mime.text import MIMEText
from email.header import Header


def send_mail(receivers, send_from, send_to, subject, content, content_type='plain'):
    mail_host = 'smtp.qq.com'
    mail_user = '876531738@qq.com'
    mail_pass = ''

    sender = '876531738@qq.com'

    message = MIMEText(content, content_type, 'utf-8')
    message['From'] = Header(send_from, 'utf-8')
    message['To'] = Header(send_to, 'utf-8')

    message['Subject'] = Header(subject, 'utf-8')

    try:
        smtpObj = smtplib.SMTP()
        smtpObj.connect(mail_host, 587)
        smtpObj.starttls()
        smtpObj.login(mail_user, mail_pass)

        smtpObj.sendmail(sender, receivers, message.as_string())
        print("Send success.")
    except smtplib.SMTPException as e:
        print(e)


def send(receivers, content):
    receivers = [receivers]
    send_from = '北理报障平台'
    send_to = 'XXX管理员'
    subject = '您有新的报障信息，请及时处理'
    content = content

    send_mail(
        receivers, send_from, send_to, subject, content, content_type='html')


if __name__ == '__main__':
    receivers = ['876531738@qq.com']
    send_from = '北理报障平台'
    send_to = 'XXX管理员'
    subject = '您有新的报障信息'
    content = '<h1>您有新的报障信息</h1>'

    send_mail(receivers, send_from, send_to, subject, content, content_type='html')

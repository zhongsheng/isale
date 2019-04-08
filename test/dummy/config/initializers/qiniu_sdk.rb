require "qiniu"

Qiniu.establish_connection! access_key: ENV.fetch('QINIU_ACCESS_KEY'),
                            secret_key: ENV.fetch('QINIU_SECRET_KEY')

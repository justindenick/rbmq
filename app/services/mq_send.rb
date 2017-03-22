require "bunny"

conn = Bunny.new(:hostname => ENV["RABBITMQ_BIGWIG_RX_URL"])

# conn = Bunny.new
conn.start
ch   = conn.create_channel

q    = ch.queue("hello")
ch.default_exchange.publish("Hello World!", :routing_key => q.name)
puts " [x] Sent 'Hello World!'"

conn.close

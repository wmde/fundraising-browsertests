# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

def generate_random_string(length = 8)
  chars = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ'
  string = ''
  length.times { string << chars[rand(chars.size)] }
  string.capitalize
end

def generate_random_amount
  prng = Random.new
  prng.rand(1..99_999)
end

def generate_random_zipcode
  prng = Random.new
  prng.rand(10_000..99_999)
end

def compose_label_xpath_for_radio(radio_id)
  "//input[@id = \'#{radio_id}\']/following::label[1]"
end

def visibility_to_boolean(parameter)
  parameter == 'shows' ? true : false
end

require 'sinatra'
require 'sinatra/reloader' if development?

def special(char)
	return [' ', ' ?', '!', '&', '#', '%', '@', '$'].include? char
end

def ceasar(string, key)
	key = key % 26
	str = ''
	string.each_char do |c|
		if (special(c) == false)
		key.times do 
			c.next!
		end
		if (c.length > 1)
		c = c[-1]
		end
		end
		str += c
	end
	return str
end




get '/ceasar' do
	text = params['text']
	key = params['key'].to_i
	encrypted  = ceasar(text, key) if ( !text.nil? && !key.nil?)
	erb :ceasar, :locals => { :encrypted => encrypted}
end
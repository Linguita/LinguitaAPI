require_relative 'models/person'

#Auhtentication example
get '/' do
    <<-HTML
    <ul>
      <li><a href='/auth/google_oauth2'>Sign in with Google</a></li>
    </ul>
    HTML
end

get '/auth/:provider/callback' do
	content_type 'text/plain'
	request.env['omniauth.auth'].to_hash.inspect rescue "No Data"
end

get '/auth/failure' do
	content_type 'text/plain'
	request.env['omniauth.auth'].to_hash.inspect rescue "No Data"
end

#API Example

class Integer
  def factors
    square_root = self**0.5
    (1..square_root).map{ |n| [n,self/n] if self/n*n == self }.compact.flatten.sort
  end

  def prime?
    self.factors.size == 2 ? true : false
  end
end

get '/:number' do
  number = params[:number].to_i
  json number: number, factors: number.factors, odd: number.odd?, even: number.even?, prime: number.prime?
end

#Mongoid Example
get '/mongo/:first_name/:last_name' do
  person = Person.new(:first_name => params[:first_name], :last_name => params[:last_name])
  person.save

  "Saved: #{person.first_name} #{person.last_name}"
end


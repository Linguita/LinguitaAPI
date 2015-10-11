require_relative 'models/user'

get '/auth/:provider/callback' do
  google_info=request.env['omniauth.auth'].to_hash["info"] rescue "No Data"
  user=User.find_by(email:google_info["email"]) rescue nil
  
  user=User.create(name:google_info["name"],email:google_info["email"],
                   first_name:google_info["first_name"],
                   last_name:google_info["last_name"],
                   image:google_info["image"]) if user.nil?
  
  json name:user.name,email:user.email,first_name:user.first_name,
       last_name:user.last_name,image:user.image,api_token:user.api_token
end

get '/auth/failure' do
	content_type 'text/plain'
	request.env['omniauth.auth'].to_hash.inspect rescue "No Data"
  "Fallo"
end

private 
  def authenticate_token!
    api_token=params[:api_token]
    @api_user = User.find_by(api_token: token)
  end


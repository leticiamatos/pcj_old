class BrowserInfo
  include ActiveModel::Serialization

  attr_accessor :remote_ip, :original_url, :user_agent, :cookie_enabled, :resolution, :available_size, :color_depth, :flash_version
  
  def attributes
    {'remote_ip' => remote_ip, 'original_url' => original_url, 'user_agent' => user_agent, 'cookie_enabled' => cookie_enabled, 'resolution' => resolution, 'available_size' => available_size, 'color_depth' => color_depth, 'flash_version' => flash_version}
  end

  def self.specs(request, params)
    browser_info = BrowserInfo.new
    browser_info.remote_ip = request.remote_ip
    browser_info.original_url = request.original_url
    browser_info.user_agent = request.env['HTTP_USER_AGENT']
    browser_info.cookie_enabled = params[:cookie_enabled]
    browser_info.resolution = params[:resolution]
    browser_info.available_size = params[:available_size]
    browser_info.color_depth = params[:color_depth]
    browser_info.flash_version = params[:flash_version]

    browser_info.serializable_hash
  end
end
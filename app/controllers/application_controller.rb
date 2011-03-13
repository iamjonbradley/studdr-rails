class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  before_filter :set_locale
  helper :all

  def default_url_options(options = {})
    #options.merge!({ :locale => I18n.locale })
    options.merge!({ })
  end

  protected

  def set_locale
    if params.include?('locale')
     @current_locale = params[:locale] 
     I18n.locale = @current_locale
    else
      @current_locale = extract_locale_from_domain
      I18n.locale = @current_locale
    end
  end  

  def extract_locale_from_domain
    parsed_locale = extract_locale_from_header(SUPPORTED_LANGUAGES)     # works excellent for localized browsers
    return parsed_locale unless parsed_locale.nil?

    return DEFAULT_LANGUAGE                                             # default language
  end

  def extract_locale_from_header(langs)
    # return nil or best match of given langs (as symbols, e.g. [:en, :ru, :ch])

    return nil if request.env["HTTP_ACCEPT_LANGUAGE"].nil?      # cannot detect language

    accepted = request.env["HTTP_ACCEPT_LANGUAGE"].split(/,/)   # comma-separated values, e.g. "ch,en,en-US"
    accepted = accepted.map { |l| l.strip.split(/\s*;\s*/) }    # each value have weight, e.g. "en-US;q=0.3"
    accepted = accepted.map do |l|
      [  l[0].split('-')[0].downcase.to_sym,                    # each language can have dialect, e.g. "en-US"
         l.length == 1 ? 1.0 : l[1].sub(/^q=\s*/, '').to_f      # default q is "1.0" (if missing)
      ]
    end

    accepted = accepted.select {|l| l if langs.include?(l[0])}  # remove unsupported languages

    return nil if accepted.empty?                               # no languages supported

    accepted.sort! { |l1, l2| l2[1] <=> l1[1] }                 # sort by quality (weight) descending

    return accepted.first[0]
  end 

  def page_file slug
    if File.exists? Rails.root.to_s+"/app/views/pages/"+slug+'.html.haml'
      page = Rails.root.to_s+"/app/views/pages/"+slug+'.html.haml'
    elsif File.exists? Rails.root.to_s+"/app/views/pages/"+slug+'.html.erb'
      page = Rails.root.to_s+"/app/views/pages/"+slug+'.html.erb'
    else
      page = '404'
    end
  end
  
#  def rescue_with_handler(exception)
#    redirect_to '/500.html'
#  end

  def method_missing(id, *args)
    redirect_to '/404.html'
  end 

def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end
end



module ApplicationHelper
   # Returns the full title on a per-page basis. 
   def full_title(page_title = '') 
    base_title = "Purpose App" 
    if page_title.empty? 
      base_title 
    else 
      page_title + " | " + base_title 
    end 
  end

  def current_user?(user)
    user && user == current_user
  end

  def store_forwarding_url
    session[:forwarding_url] = request.referrer if request.get?
  end
end

module ApplicationHelper
  def is_mobile?
    browser = Browser.new(ua: request.user_agent)

    browser.mobile? || browser.tablet?
  end
end

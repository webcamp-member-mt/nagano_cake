class ApplicationController < ActionController::Base

  def after_customers_path_for(resource_or_scope)
    if resource_or_scope == :customer
      my_page_path
    elsif resource_or_scope == :admin
      admin_root_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :customer
      root_path
    elsif resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end
end

class ApplicationController < ActionController::Base
  add_flash_types :success, :danger

  # Sorceryでデフォルトで実装されている
  def not_authenticated
    redirect_to login_path, danger: 'ログインしてください'
  end
end

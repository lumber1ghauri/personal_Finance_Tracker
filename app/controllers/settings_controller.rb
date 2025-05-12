require "ostruct"  # 🔥 Add this line

class SettingsController < ApplicationController
  before_action :authenticate_account!
  def index
    @user = OpenStruct.new(name: "", email: "")  # dummy object for frontend only
  end

  def update_profile
    redirect_to settings_path, notice: "Profile updated (frontend only)."
  end

  def update_password
    redirect_to settings_path, notice: "Password updated (frontend only)."
  end

  def update_preferences
    redirect_to settings_path, notice: "Preferences saved (frontend only)."
  end
end

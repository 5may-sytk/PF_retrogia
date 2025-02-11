# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :user_state, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private
# アクティブであるかを判断するメソッド
  def user_state
    # 入力されたemailからアカウントを1件取得
    user = User.find_by(email: params[:user][:email])
    # アカウントを取得できなかった場合、このメソッドを終了する
    return if user.nil?
    # 取得したアカウントのパスワードと入力されたパスワードが一致していない場合、このメソッドを終了する
    return unless user.is_active
    # ユーザーが有効な場合の処理を続ける（例：サインイン処理など）
  end
end

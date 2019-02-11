class SessionsController < ApplicationController
  # skip_before_action :login_required

  def new
  end

  def create
      user = User.find_by(name: session_params[:name])

      if user&.authenticate(session_params[:password])
          session[:user_id] = user.id
          redirect_to articles_path, notice: "ログインしました。こんにちは、#{user.name} 様。"
      else
          flash.now[:danger] = "ログインできませんでした。メールアドレスかパスワードが誤っています。"
          render :new
      end
  end

  def delete
      reset_session
      redirect_to root_path, notice: 'ログアウトしました。'
  end

  private

  def session_params
      params.require(:sessions).permit(:name, :password)
  end
end

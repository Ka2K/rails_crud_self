class PostsController < ApplicationController
  before_action :authorize, except: [:index]
  # 해당하는 액션을 할 때 반드시 :authorize 액션을 행하라 (부모 컨트롤러에 있음)

  def index
    @posts = Post.all
  end

  def new
  end

  def create
    Post.create(user_id: current_user.id, title: params[:title], content: params[:content])
    # username: params[:username] => user_id: current_user.id -> 1:N 관계 위해 migration 파일의 column을 바꿨으므로 바꿔주었다.
    flash[:notice] = "질문이 추가되었습니다."
    redirect_to "/"
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(user_id: current_user.id, title: params[:title], content: params[:content])
    # username: params[:username] => user_id: current_user.id -> 1:N 관계 위해 migration 파일의 column을 바꿨으므로 바꿔주었다.
    redirect_to "/posts/#{post.id}"
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:alert] = "질문이 삭제되었습니다."
    redirect_to "/"
  end
end

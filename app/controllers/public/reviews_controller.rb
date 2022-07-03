class Public::ReviewsController < ApplicationController
  before_action :correct_user, only: [:edit]
  def new
    @review = Review.new
    @user = current_user
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    # split(',')で正規表現による分割「,」で文字列を区切り、配列で返す
    tag_list = params[:review][:name].split(',')
    # APIから結果を取得し、点数化
    @review.score = Language.get_data(review_params[:body])
    if @review.save
      # save_tagはmodelに定義
      @review.save_tag(tag_list)
      redirect_to reviews_path(@review), notice: "投稿しました！"
    else
      render 'new'
    end
  end

  def index
    @reviews = Review.where(status: :published).order('id DESC')
    @review = Review.new
    @tag_list = Tag.all
  end

  def show
    @review = Review.find(params[:id])
    @user = @review.user
    @users = User.all
    @review_comment = ReviewComment.new
    # コメントを新着順で表示
    @review_comments = @review.review_comments.order(created_at: :desc)
    @review_tags = @review.tags
  end

  def edit
    @review = Review.find(params[:id])
    @tag_list = @review.tags.pluck(:name).join(',')
  end

  def update
    @review = Review.find(params[:id])
    # 入力されたtagを取得
    tag_list = params[:review][:name].split(',')
    # APIから結果を取得し、点数化
    @review.score = Language.get_data(review_params[:body])
    if @review.update(review_params)
      if params[:review][:status] == "published" || params[:review][:status] == "unpublished"
        # 既に紐づいていたtagを格納、取得して削除
        @old_relations = ReviewTag.where(review_id: @review.id)
        @old_relations.each do |relation|
          relation.delete
        end
        @review.save_tag(tag_list)
        redirect_to review_path(@review.id), notice: "編集内容を保存しました"
      else
        redirect_to reviews_path, notice: "下書きに登録しました"
      end
    else
      render 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end

  def search_tag
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @reviews = @tag.reviews.where(status: :published).order('id DESC')
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :country_id, :country_code, :area, :rate, :title, :body, :departure, :travel_cost, :accommodation_fee, :night, :status, :travel_image, :lat, :lng)
  end

  def correct_user
    @review = Review.find(params[:id])
    @user = @review.user
    redirect_to(reviews_path) unless @user == current_user
  end

end

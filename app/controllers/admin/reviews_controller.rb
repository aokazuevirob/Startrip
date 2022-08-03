class Admin::ReviewsController < ApplicationController

  def index
    @reviews = Review.published.order('id DESC')
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
    # Google_API/自然言語処理・感情分析
    @review.score = Language.get_data(review_params[:body])
    if @review.update(review_params)
      if params[:review][:status] == "published" || params[:review][:status] == "unpublished"
        # 既に紐づいていたtagを格納、取得して削除
        @old_relations = ReviewTag.where(review_id: @review.id)
        @old_relations.each do |relation|
          relation.delete
        end
        @review.save_tag(tag_list)
        redirect_to admin_review_path(@review.id), notice: "編集内容を保存しました"
      else
        redirect_to admin_reviews_path, notice: "下書きに登録しました"
      end
    else
      render 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_reviews_path
  end

  def search_tag
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @reviews = @tag.reviews.published.order('id DESC')
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :country_id, :country_code, :area, :rate, :title, :body, :departure, :travel_cost, :accommodation_fee, :night, :status, :travel_image)
  end

end

class ActionsController < ApplicationController
    before_action :authenticate_customer!

    def article_with_actions
        @actions = current_customer.actions
        article_ids = @actions.map(&:article_id)
        @articles = Article.where(id: article_ids)
    end


    def customer_action
        @customer = current_customer
        @article = Article.find(params[:article_id])
        action = Action.find_by(customer_id: @customer.id, article_id: @article.id)
        if action
          return flash.now[:alert] = 'Ya reacionaste a este articulo'
        else
          @new_action = Action.new(customer_id: @customer.id, article_id: @article.id, kind: params[:kind])
          respond_to do |format|
            if @new_action.save!
              format.html { redirect_to article_path(@article), notice: " #{current_customer.email} 
               has declarado ??? #{@new_action.kind} del articulo" }
            else
              format.html { redirect_to article_path(@article), status: :unprocessable_entity }
            end
          end
        end
      end

end

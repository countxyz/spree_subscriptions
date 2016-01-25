module Spree
  class SubscriptionsController < Spree::StoreController
    before_action :find_subscription

    def pause
      @subscription.pause
      redirect_to :back
    end

    def resume
      @subscription.resume(resume_at_param)
      redirect_to :back
    end

    def cancel
      @subscription.cancel
      redirect_to :back
    end

    def update
      @subscription.attributes = resource_params
      render :edit
    end

    def add_item
      variant = Spree::Variant.accessible_by(current_ability, :read).find(params[:variant_id])

      return unless variant.product.subscribable?
      ::Spree::SubscriptionItem.create!(
        subscription: @subscription,
        variant: variant,
        quantity: 1,
        interval: @subscription.interval
      )
      render :edit
    end

    private

    def find_subscription
      @subscription = Spree::Subscription.accessible_by(current_ability, :read).find(params[:id])
    end

    def resume_at_param
      Date.parse(params.require(:subscription).require(:resume_at))
    end

    private

    def resource_params
      params.require(:subscription).permit!
    end

  end
end
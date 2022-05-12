class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  private

  def render_not_found
    render plain: I18n.t('errors.not_found'), status: :not_found
  end
end

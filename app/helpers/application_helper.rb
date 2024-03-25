# Helper methods for the application
module ApplicationHelper
  def form_model_errors(model, attribute)
    return unless model.errors.any?

    content_tag(:div, class: "form-text text-danger", id: attribute) do
      model.errors.full_messages_for(attribute).join(", ")
    end
  end
end

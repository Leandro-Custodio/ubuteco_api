# frozen_string_literal: true

class Wine < Product
  validates :abv,
            :quantity_stock,
            :description,
            :vintage_wine,
            :maker,
            :visual,
            :ripening,
            :grapes,
            :wine_style,
            presence: true

  belongs_to :maker
  belongs_to :wine_style
  belongs_to :user

  def to_json(*_args)
    super(include: %i[wine_style maker])
  end
end

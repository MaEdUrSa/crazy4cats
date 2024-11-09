class Article < ApplicationRecord


    has_and_belongs_to_many :descriptions

    has_many :actions
    has_many :customer, through: :actions


    #  crea una nueva categoria si biene blanco
    accepts_nested_attributes_for :descriptions, reject_if: :no_name_category

    def no_name_description(attributes)
        attributes['name'].blank?
    end

    def count_with_kind(arg)
        number = self.actions.where(kind: arg).count
        return "#{arg} - #{number}"
    end

    def find_kind_customer_relation(customer)
        self.actions.find_by(customer_id: customers.id).kind
    end
end

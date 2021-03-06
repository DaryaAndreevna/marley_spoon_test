# frozen_string_literal: true

############## Usage #################
######################################
#
# class RecipeEntry < BaseEntry
#   fields :id,
#          :title,
#          :calories,
#          :description
#
#   linked_entries :photo, :chef, :tags
# end
#
#######################################

class BaseEntry
  def self.fields(*args)
    class_eval(<<-END, __FILE__, __LINE__)
      FIELDS = args
      attr_accessor #{args.map { |v| ":#{v}" }.join(', ')}
    END
  end

  def self.linked_entries(*args)
    class_eval(<<-END, __FILE__, __LINE__)
      LINKED_ENTRIES = args
      attr_accessor #{args.map { |v| ":#{v}" }.join(', ')}
    END
  end

  def initialize(**args)
    args.slice(*self.class::FIELDS).each do |allowed_field, value|
      instance_variable_set("@#{allowed_field}", value)
    end
  end
end

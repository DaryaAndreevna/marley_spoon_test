# frozen_string_literal: true

RSpec.describe BaseEntry do
  subject(:base) { described_class.new(params) }

  expected_fields = %i[some_field another_field]
  expected_linked_entries = %i[some_entries]

  described_class.class_eval do
    fields *expected_fields
    linked_entries *expected_linked_entries
  end

  let(:params) do
    {
      some_field: "some_field",
      another_field: "another_field",
      some_entries: "some_entries"
    }
  end

  it "defines fields" do
    expected_fields.each do |field|
      expect(base).to respond_to(field)
    end
  end

  it "defines linked entries" do
    expected_linked_entries.each do |linked_entry|
      expect(base).to respond_to(linked_entry)
    end
  end

  it "has instance variables set" do
    expected_fields.each do |field|
      expect(base.instance_variable_get("@#{field}")).not_to be_nil
    end
  end
end

# frozen_string_literal: true

RSpec.shared_context "contentful_client" do
  let(:contentful_client) { ContentfulClient.instance }

  let(:recipe_records) do
    [ recipe_record ]
  end

  let(:recipe_record) do
    instance_double "RecipeRecord",
    {
      id: id,
      fields: fields,
      title: title,
      description: description,
      calories: calories,
      photo: photo_record,
      chef: chef_record,
      tags: [tag_record]
    }
  end

  let(:fields) { { title: title, calories: calories, description: description } }
  let(:photo_record) { instance_double("Photo", id: "photo.id", fields: {}) }
  let(:chef_record) { instance_double("Chef", id: "chef.id", fields: {}) }
  let(:tag_record) { instance_double("Tag", id: "tag.id", fields: {}) }

  let(:id) { "ID" }
  let(:title) { "Title" }
  let(:calories) { "Calories" }
  let(:description) { "Description" }

  before do
    allow(contentful_client).to receive(:recipe).and_return(recipe_record)
    allow(contentful_client).to receive(:recipes).and_return(recipe_records)
  end
end

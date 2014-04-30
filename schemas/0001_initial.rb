
schema "0001 initial" do

  # Examples:
  #
  entity "Man" do
    string :name

    has_many :apples
  end

  entity "Apple" do
    string :name

    belongs_to :man
  end

end

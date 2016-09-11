require "spec_helper"

describe Array do

  context "#all_empty?" do

    it "returns true if all elements of the Array are empty" do
      expect(["", "", ""].all_empty?).to be_truthy
    end

    it "returns false if some of the Array elements are not empty" do
      expect(["", 1, Object.new, :a].all_empty?).to be_falsey
    end

    it "returns true for an empty Array" do
      expect([].all_empty?).to be_truthy
    end

  end

  context "#all_same?" do

    it "returns true if all elements of the Array are the same" do
      expect(["A", "A", "A"].all_same?).to be_truthy
    end

    it "returns false if some of the Array elements are not the same" do
      expect(["", 1, Object.new, :a].all_same?).to be_falsey
    end

    it "returns true for an empty Array" do
      expect([]).to be_truthy
    end

  end

  context "#any_empty?" do

    it "returns true if any element of the Array is empty" do
      expect(["A", "", "A"].any_empty?).to be_truthy
    end

    it "returns false if any element of the Array is not empty" do
      expect(["A", "A", "A"].any_empty?).to be_falsey
    end

    it "returns true for an empty Array" do
      expect([]).to be_truthy
    end

  end

  context "#none_empty?" do

    it "returns true if none of the Array elements is empty" do
      expect(["A", "B", "C"].none_empty?).to be_truthy
    end

    it "returns false if some of the Array elements are empty" do
      expect(["", 1, Object.new, :a].none_empty?).to be_falsey
    end

    it "returns true for an empty Array" do
      expect([].none_empty?).to be_truthy
    end

  end

end
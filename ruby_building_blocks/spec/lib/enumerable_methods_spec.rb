require 'spec_helper'
require 'enumerable_methods'

describe Enumerable do
  let(:numbers) { [1, 2, 3, 4] }
  let(:strings) { ['abc', 'd', 'ef'] }

  describe "#my_each" do
    context "when no block given" do
      it "returns an enumerator" do
        expect(numbers.my_each).to be_instance_of(Enumerator)
      end
    end

    context "when block given" do
      it "calls the given block once for each element" do
        result = []
        numbers.my_each { |x| result << x }
        expect(result).to eql([1, 2, 3, 4])
      end

      it "doesn't change the original object" do
        numbers.my_each { |x| x + 5 }
        expect(numbers).to eql([1, 2, 3, 4])
      end
    end
  end

  describe "#my_select" do
    context "when no block given" do
      it "returns an enumerator" do
        expect(numbers.my_select).to be_instance_of(Enumerator)
      end
    end

    context "when block given" do
      context "given [1, 2, 3, 4], select even numbers" do
        it "returns [2,4]" do
          expect(numbers.my_select { |x| x % 2 == 0}).to eql([2, 4])
        end
      end

      context "given [1, 2, 3, 4], select numbers higher than 2" do
        it "returns [3, 4]" do
          expect(numbers.my_select{ |x| x > 2 }).to eql([3, 4])
        end
      end

      context "given ['abc', 'd', 'ef'], select strings longer than 1" do
        it "returns ['abc', 'ef']" do
          expect(strings.my_select { |x| x.length > 1 }).to eql(['abc', 'ef'])
        end
      end
    end
  end

  describe "#my_all?" do
    context "no block given" do
      context "given [1, 2, 3, 4]" do
        it "returns true" do
          expect(numbers.my_all?).to be true
        end
      end

      context "given [nil, 2, 3, nil]" do
        it "returns false" do
          expect([nil, 2, 3, nil].my_all?).to be false
        end
      end
    end

    context "block given" do
      context "given [1, 2, 3, 4], check if all elements are integers" do
        it "returns true" do
          expect(numbers.my_all? { |x| x.kind_of?(Integer) }).to be true
        end
      end

      context "given ['abc', 'd', 'ef'], check if all elements are integers" do
        it "returns false" do
          expect(strings.my_all? { |x| x.kind_of?(Integer) }).to be false
        end
      end
    end
  end

  describe "#my_any" do
    context "no block given" do
      context "given [1, 2, 3, 4]" do
        it "returns true" do
          expect(numbers.my_any?).to be true
        end
      end

      context "given [nil, nil, nil]" do
        it "returns false" do
          expect([nil, nil, nil].my_any?).to be false
        end
      end
    end

    context "block given" do
      context "given [1, 2, 3, 4] and { |x| x > 3 }" do
        it "returns true" do
          expect(numbers.my_any? { |x| x > 3 }).to be true
        end
      end

      context "given [1, 2, 3, 4] and { |x| x > 4 }" do
        it "returns false" do
          expect(numbers.my_any? { |x| x > 4 }).to be false
        end
      end
    end
  end

  describe "#my_count" do
    context "no block and argument given" do
      context "given [1, 2, 3, 4]" do
        it "returns 4" do
          expect(numbers.my_count).to eql(4)
        end
      end
    end

    context "no block given, but argument given" do
      context "given [1, 2, 3, 4] and 2 as argument" do
        it "returns 1" do
          expect(numbers.my_count(2)).to eql(1)
        end
      end

      context "given [2, 2, 3, 4] and 2 as argument" do
        it "returns 2" do
          expect([2, 2, 3, 4].my_count(2)).to eql(2)
        end
      end
    end

    context "block given" do
      context "given [1, 2, 3, 4], count even numbers" do
        it "returns 2" do
          expect(numbers.my_count { |x| x % 2 == 0 }).to eql(2)
        end
      end
    end
  end

  describe "#my_inject" do
    context "no block given" do
      context "given [1, 2, 3, 4] and :+ as argument" do
        it "returns 10" do
          expect(numbers.my_inject(:+)).to eql(10)
        end
      end

      context "given [1, 2, 3, 4] and :* as argument" do
        it "returns 24" do
          expect(numbers.my_inject(:*)).to eql(24)
        end
      end

      context "given [1, 2, 3, 4] and 2 and :- as arguments" do
        it "returns 5" do
          expect(numbers.my_inject(2, :-)).to eql(-8)
        end
      end

      context "given [1, 2, 3, 4] and 0 and :* as arguments" do
        it "returns 0" do
          expect(numbers.my_inject(0, :*)).to eql(0)
        end
      end
    end

    context "block given" do
      context "given [1, 2, 3, 4] and { |product, x| product * x }" do
        it "returns 24" do
          expect(numbers.my_inject { |product, x| product * x } ).to eql(24)
        end
      end

      context "given [1, 2, 3, 4], 2 as argument and { |product, x| product * x }" do
        it "returns 48" do
          expect(numbers.my_inject(2) { |product, x| product * x } ).to eql(48)
        end
      end
    end
  end

end

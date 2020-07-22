require 'test/unit'

class MonsterTest < Test::Unit::TestCase
  def setup
    # Do nothing
  end

  def teardown
    # Do nothing
  end

  describe 'smoke test' do
    it 'basic smoke test' do
      a = 1
      b = 1
      expect(a).to eq(b)
    end
  end
end
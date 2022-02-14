class User < ApplicationRecord
  def test_by_level(level)
    Test.joins('JOIN test_passages ON tests.id = test_passages.test_id')
      .where('test_passages.user_id = ? AND tests.level = ?', id, level)
  end
end


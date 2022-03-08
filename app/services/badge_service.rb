class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    @category = test_passage.test.category
  end

  def give_badge
    return [] unless @test_passage.success?
    Badge.select { |badge| send("#{badge.rule}?", badge) }
  end

  private

  def success_first_try?(_args)
    @user.tests.where(id: @test.id).count == 1
  end

  def success_by_level?(level)
    Test.where(level: level).count == @user.tests_by_level(level).uniq.count
  end

  def success_all_categories?(category)
    @category.tests.count == @user.tests.where(category_id: category.id).uniq.count
  end
end

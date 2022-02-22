class GistsController < ApplicationController
  def create
    @test_passage = TestPassage.find(params[:test_passage_id])
    result = GistQuestionService.new(@test_passage.current_question).call

    flash_options = if result.html_url.present?
                      current_user.gists.create!(question: @test_passage.current_question, url: result.html_url)
                      { notice: t('.success', url: result.html_url) }
                    else
                      { alert: t('failure') }
                    end

    redirect_to @test_passage, flash_options
  end
end

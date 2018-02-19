require "rails_helper"

module Quiz
  RSpec.describe Quiz do
    context 'with valid setup' do
      it 'returns correct number of questions' do 
        expect(Question.count).to eq(47);
      end

      it 'returns correct number of choices' do
        expect(Choice.count).to eq(235);
      end

      it 'returns correct number of categories' do
        expect(Category.count).to eq(2);
      end

      it 'returns correct number of questions for category *Argument Structure Questions*' do
        expect(Category.first.questions.count).to eq(22);
      end

      it 'returns correct number of questions for category *Main Point Questions*' do
        expect(Category.last.questions.count).to eq(25);
      end

      it 'returns five choices for each question' do
        expect(Question.count*5).to eq(Choice.count);
      end
    end
  end
end

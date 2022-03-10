class Booking < ApplicationRecord
  belongs_to :vending_machine
  belongs_to :user


  def color
    if (created_at + 90.minutes) > Time.now
      "#1edd88" # RAG - Green
    elsif (created_at + 120.minutes) > Time.now
      "#FFC65A" # RAG - Amber
    else
      "#dd6860" # RAG - Red
    end
  end

  #  "#FFC65A" !!! or #E67E22 # RAG - Amber
end

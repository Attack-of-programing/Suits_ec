class Admin::HomesController < ApplicationController
  def top
    # 現在の日時を取得
    now = Time.current
    # 本日の注文の取得
    @orders = Order.where(created_at: now.all_day)
  end
end

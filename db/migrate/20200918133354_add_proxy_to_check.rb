# frozen_string_literal: true

class AddProxyToCheck < ActiveRecord::Migration[6.0]
  def change
    add_column :checks, :proxy, :boolean, default: false
  end
end

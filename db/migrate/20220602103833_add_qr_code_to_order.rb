class AddQrCodeToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :qr_code, :string
  end
end

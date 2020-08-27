RSpec.describe ExtractSchedulesService do
	before(:each) do
		@payment = Payment.create(amount: 200000, description: "Xbox One", quantity: 1)
	end

	context "creating payments" do
		it "has a invoice with pending status" do
			result = ExtractSchedulesService.new({payment_id: @payment.id}).charge
			expect(result).to eq("pending")
		end
	end
end
describe Vote do 
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do

       before do
         @v = Vote.new(value: 1)
         @v2 = Vote.new(value: -1)
         @v3 = Vote.new(value: 2)
       end

       describe '1 as value' do # Or should this reference the method #valid?
         it "returns 1 as true" do
           expect( @v.valid ).to eq(true)
         end
       end

       describe '-1 as value' do
         it "returns -1 as true" do
           expect( @v2.valid ).to eq(true)
         end
       end  

       describe '2 as value' do
         it "returns 2 as false" do
           expect( @v3.valid ).to eq(false)
         end
       end 

      end
    end
  end
end
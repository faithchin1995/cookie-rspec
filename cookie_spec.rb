
require 'rspec'

require_relative 'cookie'

describe Cookie do

  let(:type)   { "peanut butter" }
  let(:cookie) { Cookie.new(type) }

  describe "#initialize" do
    context "with valid input" do
      it "creates a new Cookie of the specified type" do
        expect(cookie.type).to eq(type)
      end
    end

    context "with invalid input" do
      it "throws an argument error when not given a type argument" do
        expect { Cookie.new }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#type" do
    it "returns the type of the cookie" do
      expect(cookie.type).to eq(type)
    end
  end

  describe "#bake!" do
    it "requires an integer time argument" do
      # cookie.bake!(8)
     # cookie.should_receive(bake!).with(Fixnum)
     expect(cookie).to receive(:bake!).with(Fixnum)
     cookie.bake!(9)
    end


    it "returns the cookie object" do
      x = cookie.bake!(7)
      expect(x).to eq(cookie)
    end


    it "changes the status of the cookie when given enough time" do
      expect { cookie.bake!(10) }.to change(cookie, :status)
    end
  end

  describe "#status" do
    it "returns the cookie's current status" do
      cookie.status
    end


    context "when unbaked" do
      it "is `:doughy`" do
        cookie
        expect(cookie.status).to be(:doughy)
      end

    end

    context "when baked for less than 7 minutes" do
      it "is `:doughy`" do
        cookie.bake!(5)
        expect(cookie.status).to be(:doughy)
      end
    end

    context "when baked for at least 7 but less than 10 minutes" do
      it "is `:almost_ready`" do
        cookie.bake!(8)
        expect(cookie.status).to be (:almost_ready)
      end
    end

    context "when baked for at least 10 but less than 12 minutes" do
      it "is `:ready`" do
        cookie.bake!(11)
        expect(cookie.status).to be (:ready)
      end
    end

    context "when baked for at least 12 minutes" do
      it "is `:burned`" do
        cookie.bake!(13) 
        expect(cookie.status).to be (:burned)
      end
    end
  end
end
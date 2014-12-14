require 'spec_helper'

describe HasSerialized do
  before do
    reset_database
  end

  describe "accessing variables" do
    before do
      @page = Page.create!
    end

    it "should serialize with default" do
      @page.gunslinger.should be_true
    end

    it "should allow assignment" do
      @page.gunslinger = false
      @page.gunslinger.should be_false
    end
  end

  it 'should be able to override certain defaults during instantiation' do
    page = Page.new(gunslinger: 'Roland', jake: false, ka_tet: nil)
    expect(page.gunslinger).to eq('Roland')
    expect(page.lowmen).to be_true
    expect(page.jake).to eq(false)
    expect(page.ka_tet).to be_nil
  end

  it 'should create getters that end with question marks for boolean fields' do
    page = Page.new(gunslinger: false, jake: true)
    expect(page.gunslinger?).to be_false
    expect(page.jake?).to be_true
    expect(page).to_not respond_to(:ka_tet?)
  end

  describe "validations" do
    class ValidatedPage < Page
      validates :gunslinger, presence: true
    end

    let(:page) { ValidatedPage.new(gunslinger: nil) }

    specify { expect(page).to be_invalid }
  end

  describe "serialized_attributes" do
    class Settings < ActiveRecord::Base
      has_serialized :serialized_attributes, foo: 'bar'
      validates :foo, presence: true
    end

    let(:invalid_settings) { Settings.new(foo: nil) }

    specify { expect(invalid_settings).to be_invalid }
  end
end

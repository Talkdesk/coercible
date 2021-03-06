require 'spec_helper'

describe Coercer::TimeCoercions, '.to_datetime' do
  subject { object.to_datetime(value) }

  let(:object)  { coercer.new }
  let(:coercer) { Class.new(Coercer::Object) { include Coercer::TimeCoercions } }
  let(:value)   { double('value') }

  after do
    Coercer::Object.descendants.delete(coercer)
  end

  context 'when the value responds to #to_datetime' do
    before do
      object.extend Coercer::TimeCoercions

      expect(value).to receive(:to_datetime).and_return(DateTime.new(2011, 1, 1, 0, 0, 0))
    end

    it { is_expected.to be_instance_of(DateTime) }

    it { is_expected.to eql(DateTime.new(2011, 1, 1, 0, 0, 0)) }
  end

  context 'when the value does not respond to #to_datetime' do
    before do
      object.extend Coercer::TimeCoercions

      # use a string that DateTime.parse can handle
      expect(value).to receive(:to_s).and_return('2011-01-01T00:00:00+00:00')
    end

    it { is_expected.to be_instance_of(DateTime) }

    it { is_expected.to eql(DateTime.new(2011, 1, 1, 0, 0, 0)) }
  end
end

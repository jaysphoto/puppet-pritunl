require 'spec_helper'

describe 'pritunl' do
  context 'when using unknown OS it should fail' do
    let(:title) { 'pritunl' }
    let(:facts) { { os: { name: 'fail' } } }

    it { is_expected.to compile.and_raise_error(/'fail' not supported/) }
  end

  context 'when using centos' do
    let(:title) { 'pritunl-centos' }
    let(:facts) { { os: { name: 'CentOS' } } }
    let(:pre_condition) do
      (MockResource.new 'pritunl::centos', {}).render
    end

    it { is_expected.to compile }
    it { is_expected.to contain_class('pritunl::centos') }
  end

  context 'when using ubuntu' do
    let(:title) { 'pritunl-ubuntu' }
    let(:facts) { { os: { name: 'Ubuntu' } } }
    let(:pre_condition) do
      (MockResource.new 'pritunl::ubuntu', {}).render
    end

    it { is_expected.to compile }
    it { is_expected.to contain_class('pritunl::ubuntu') }
  end
end

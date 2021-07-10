require 'spec_helper'

describe 'pritunl::ubuntu' do
  context 'Install pritunl apt repo' do
    let(:title) { 'pritunl-ubuntu' }
    let(:facts) do
      {
        os: { name: 'Ubuntu', release: { major: '20', minor: '04' } }
      }
    end
    let(:pre_condition) do
      (MockResource.new 'apt::source',
                        type: :define,
                        params: { location: '', repos: '', key: nil }
      ).render
    end

    it { is_expected.to compile }
    it { is_expected.to contain_apt__source('pritunl') }
    it { is_expected.to contain_package('pritunl') }
  end
end

require 'spec_helper'

describe 'pritunl::centos' do
  context 'Install pritunl centos repo' do
    let(:title) { 'pritunl-centos' }
    let(:facts) do
      {
        os: { name: 'CentOS', release: { major: '8' } }
      }
    end
    let(:pre_condition) do
      (MockResource.new 'yumrepo',
                        type: :define,
                        params: { enabled: nil, gpgcheck: nil, descr: '', baseurl: '' }
      ).render
    end

    it { is_expected.to contain_file('/etc/pki/rpm-gpg/RPM-GPG-KEY-pritunl')\
      .with_content(/BEGIN PGP PUBLIC KEY BLOCK/)
    }
    it { is_expected.to contain_package('pritunl') }
    it { is_expected.to contain_yumrepo('pritunl')
      .with(
        enabled: 1,
        gpgcheck: 1,
        baseurl: 'https://repo.pritunl.com/stable/yum/centos/8/'
      )
    }
  end
end

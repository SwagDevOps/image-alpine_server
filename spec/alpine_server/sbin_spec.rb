# frozen_string_literal: true

describe 'sbin files', :sbin do
  describe file('/sbin/runsvdir-start') do
    it { should be_file }

    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 755 }

    its(:md5sum) { should eq '1594843d8c234480cff25fdf5f792174' }
  end

  describe file('/sbin/ylem') do
    it { should be_file }

    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }

    its(:md5sum) { should eq '4e9e6318d79a1e3095989d649d653e67' }
  end
end

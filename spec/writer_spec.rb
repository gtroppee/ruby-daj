require 'spec_helper'
describe Writer do  

  it '#write_plain_data' do
    data = "Hello, world!"
    daj(data) > resources_path('test_hello.txt')
    expect(data).to eq daj < resources_path('test_hello.txt')

    delete_resources('test_hello.txt')
  end

  it '#write_json' do
    data1 = {'hello' => 'world'}
    data2 = {hello: 'world'}

    daj(data1) > resources_path('test_hello1.json')
    daj(data2) > resources_path('test_hello2.json')

    expect(data1).to eq daj      < resources_path('test_hello1.json')
    expect(data1).to eq daj.json < resources_path('test_hello2.json')

    delete_resources('test_hello1.json', 'test_hello2.json')
  end

  it '#write_yaml' do
    data = {"hello"=>"world", "colors"=>["yellow", "blue"]}
    daj(data) > resources_path('test_hello.yml')
    expect(data).to eq daj < resources_path('test_hello.yml')

    delete_resources('test_hello.yml')
  end

  it '#write_csv' do
    data = [['Joe', 'Dagger'], ['Elena', 'Ashcroft']]
    daj(data) > resources_path('test_names.csv')
    expect(data).to eq daj < resources_path('test_names.csv')

    delete_resources('test_names.csv')
  end

  it '#write_csvh' do
    data = [{'Firstname'=>'Joe', 'Lastname'=>'Dagger'}, {'Firstname'=>'Elena', 'Lastname'=>'Ashcroft'}]
    daj.csvh(data) > resources_path('test_hnames.csv')
    expect(data).to eq daj.csvh < resources_path('test_hnames.csv')

    delete_resources('test_hnames.csv')
  end

  it '#write_tsv' do
    data = [['Joe', 'Dagger'], ['Elena', 'Ashcroft']]
    daj(data) > resources_path('test_names.tsv')
    expect(data).to eq daj < resources_path('test_names.tsv')

    delete_resources('test_names.tsv')
  end

  # it '#write_tsvh' do
  #   data = [{'Firstname'=>'Joe', 'Lastname'=>'Dagger'}, {'Firstname'=>'Elena', 'Lastname'=>'Ashcroft'}]
  #   daj.tsvh(data) > resources_path('test_hnames.tsv')
  #   expect(data).to eq daj.tsvh < resources_path('test_hnames.tsv')

  #   delete_resources('test_hnames.tsv')
  # end

  it 'should raise an exception if no data is provided' do
    expect { daj.csvh > resources_path('test_hnames.csv') }.to raise_error
  end
end
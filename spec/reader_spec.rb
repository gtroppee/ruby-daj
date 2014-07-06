require 'spec_helper'
describe Reader do  

  it '#read_plain_text' do
    data = "Hello World !"
    expect(data).to eq daj < resources_path('hello.txt')
  end

  it '#read_json' do
    data = {"hello"=>"world", "colors"=>["yellow", "blue"]}
    expect(data).to eq daj      < resources_path('hello.json')
    expect(data).to eq daj.json < resources_path('hello.json')
  end

  it '#read_yml' do
    data = {"hello"=>"world", "colors"=>["yellow", "blue"]}
    expect(data).to eq daj     < resources_path('hello.yml')
    expect(data).to eq daj.yml < resources_path('hello.yml')
  end

  it '#read_csv' do
    names = [['Joe', 'Dagger'], ['Elena', 'Ashcroft']]
    hnames = [{'Firstname'=>'Joe', 'Lastname'=>'Dagger'}, {'Firstname'=>'Elena', 'Lastname'=>'Ashcroft'}]
    expect(names).to  eq daj      < resources_path('names.csv')
    expect(names).to  eq daj.csv  < resources_path('names.csv')
    expect(hnames).to eq daj.csvh < resources_path('hnames.csv')
  end

  it '#read_tsv' do
    names = [['Joe', 'Dagger'], ['Elena', 'Ashcroft']]
    hnames = [{'Firstname'=>'Joe', 'Lastname'=>'Dagger'}, {'Firstname'=>'Elena', 'Lastname'=>'Ashcroft'}]
    expect(names).to eq daj     < resources_path('names.tsv')
    expect(names).to eq daj.tsv < resources_path('names.tsv')
    expect(hnames).to eq daj.tsvh < resources_path('hnames.tsv')
  end

end
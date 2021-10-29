class CurrenciesController < ApplicationController
  def first_currency
    url = 'https://api.exchangerate.host/symbols'
    # get JSON
    json = open(url).read
    # parse JSON to dictionary
    parsed_json = JSON.parse(json)
    @array_of_symbols = parsed_json.fetch('symbols').keys
    render({:template => "currency_templates/step_one.html.erb"})
  end

  def second_currency
    url = 'https://api.exchangerate.host/symbols'
    # get JSON
    @curr_symb = params.fetch('from_currency')
    json = open(url).read
    # parse JSON to dictionary
    parsed_json = JSON.parse(json)
    @array_of_symbols = parsed_json.fetch('symbols').keys
    render({:template => "currency_templates/step_two.html.erb"})
  end

  def conversion
    @from_currency = params.fetch('from_currency')
    @to_currency = params.fetch('to_currency')
    url = "https://api.exchangerate.host/convert?from="+ @from_currency + "&to=" + @to_currency
    parsed_json = JSON.parse(open(url).read)
    @rate = parsed_json.fetch('info').fetch('rate')
    render({:template => "currency_templates/step_three.html.erb"})
  end
end
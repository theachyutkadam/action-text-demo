namespace :customer_crud_operation do
  desc "TODO"
  task create_customer: :environment do
  	url = "http://localhost:1025/api/v1/students"
    response = RestClient.get(url, headers={"X-AUTH-TOKEN" => 1})
    @students = JSON.parse(response)
    @students.each do |student|
  		customer = Customer.new
    	student.each do |key, value|
    		if key == 'first_name'
    			customer.first_name = value
    		elsif key == 'last_name'
    			customer.last_name = value
    		elsif key == 'date_of_birth'
    			customer.birthdate = value
    		elsif key == 'aadhaar_card_number'
    			customer.contact = value.first(10)
    		else
    			customer.email = "#{customer.first_name}@gmail.com"
    		end
    	end
  		customer.save
	    puts "----------Create #{customer.first_name} #{customer.last_name} Customer Successfully----------"
	    puts "======================="
	    puts customer.inspect
	    puts "======================="
    end
  	puts "----------create customers----------"
  end

  desc "TODO"
  task delete_customer: :environment do
  	count = Customer.count - 4
  	puts "----------Starting Customers Deleting----------"
  	Customer.last(count).each(&:destroy)
  	puts "----------Destroy All Customers----------"
  end

end

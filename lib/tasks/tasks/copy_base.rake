namespace :import do
	desc "Import copy from airtable"
	task copy_base: :environment do 
		Airtable::FetchDataOnLoad.call
	end
end

unless @stores.nil?
	json.stores do
		@stores.each{ |store| json.set! store.id.to_s, store.title }
	end
else
	json.stores do
		@stores = false
	end
end

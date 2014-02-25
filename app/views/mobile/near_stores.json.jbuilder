json.stores do
  @stores.order("distance desc").each{ |store| json.set! store.id.to_s, store.title }
  # @stores.order("stores.distance desc").each{ |store| json.set! store.id.to_s, store.title }
end

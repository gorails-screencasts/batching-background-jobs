class CreateServerJob
  include Sidekiq::Worker

  def perform(id)
    # Do your work in parallel
    i = rand(1..10)
    puts "Creating server #{id}..."
    sleep i
    puts "Created server #{id}..."
  end
end

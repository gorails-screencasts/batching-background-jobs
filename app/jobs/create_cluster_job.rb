class CreateClusterJob
  def perform
    batch = Sidekiq::Batch.new
    batch.description = "Creating cluster"
    batch.on(:success, CreateClusterJob::Created, { 'cluster_id' => 999 })
    batch.jobs do
      5.times { |i| CreateServerJob.perform_async(i) }
    end
  end

  class Created
    def on_success(status, options)
      puts "----"
      puts status, options
      puts "Created cluster."
    end
  end
end

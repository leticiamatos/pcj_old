require File.expand_path(File.join(File.dirname(__FILE__), "rails.rb"))

module MongodbLogger::SpecMacros
  def should_contain_one_log_record
    it "contain a log record" do
      @mongo_adapter.collection.find.count.should == 1
    end
  end

  def should_use_database_name_in_config
    it "use the database name in the config file" do
      @mongodb_logger.db_configuration['database'].should == "system_log"
    end
  end

  def should_have_default_capsize
    it "cap collection the same size as in default" do
      @mongo_adapter.collection_stats[:storageSize].should >= MongodbLogger::Logger::DEFAULT_COLLECTION_SIZE
      @mongo_adapter.collection_stats[:storageSize].should < MongodbLogger::Logger::DEFAULT_COLLECTION_SIZE + 1.megabyte
    end
  end
end
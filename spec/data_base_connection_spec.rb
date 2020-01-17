require 'data_base_connection'

describe DataBaseConnection do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
      DataBaseConnection.setup('bookmark_manager_test')
    end
  end
end

describe '.query' do
  it 'executes a query via PG' do
    connection = DataBaseConnection.setup('bookmark_manager_test')

    expect(connection).to receive(:exec).with("SELECT * FROM bookmarks;")

    DataBaseConnection.query("SELECT * FROM bookmarks;")
  end
end
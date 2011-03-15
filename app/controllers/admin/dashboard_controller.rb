class Admin::DashboardController < Admin::AdminController

  def index
    features_table = CartoDB::Connection.table 'features'
    @features_columns = features_table.schema.reject{|c| %w(cartodb_id created_at updated_at).include?(c.first)}.compact
    @features = CartoDB::Connection.records 'features'
  end

end
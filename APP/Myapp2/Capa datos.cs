public abstract  class ConnectionSql
    {
        protected SqlConnectiongetConnection()
        {
            return new SqlConnection(
      "Server=(local); DataBase=BikeStore; integrated security=true"
      );
        }
    }

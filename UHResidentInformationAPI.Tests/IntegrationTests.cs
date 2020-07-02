using System.Net.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage;
using Npgsql;
using NUnit.Framework;
using UHResidentInformationAPI.V1.Infrastructure;

namespace UHResidentInformationAPI.Tests
{
    public class IntegrationTests<TStartup> where TStartup : class
    {
        protected HttpClient Client { get; private set; }
        protected UHContext UHContext { get; private set; }

        private MockWebApplicationFactory<TStartup> _factory;
        private NpgsqlConnection _connection;
        private IDbContextTransaction _transaction;
        private DbContextOptionsBuilder _builder;

        [OneTimeSetUp]
        public void OneTimeSetUp()
        {
            _connection = new NpgsqlConnection(ConnectionString.TestDatabase());
            _connection.Open();
            var npgsqlCommand = _connection.CreateCommand();
            npgsqlCommand.CommandText = "SET deadlock_timeout TO 30";
            npgsqlCommand.ExecuteNonQuery();

            _builder = new DbContextOptionsBuilder();
            _builder.UseNpgsql(_connection);

        }

        [SetUp]
        public void BaseSetup()
        {
            _factory = new MockWebApplicationFactory<TStartup>(_connection);
            Client = _factory.CreateClient();
            UHContext = new UHContext(_builder.Options);
            UHContext.Database.EnsureCreated();
            _transaction = UHContext.Database.BeginTransaction();
        }

        [TearDown]
        public void BaseTearDown()
        {
            Client.Dispose();
            _factory.Dispose();
            _transaction.Rollback();
            _transaction.Dispose();
        }
    }
}
using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(webada.NET.Startup))]
namespace webada.NET
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

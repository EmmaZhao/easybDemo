import junit.framework.Assert;

import util.*

scenario "获取正确的应用服务发布端地址", {
		given "路由服务器启动", {
			router = new Router()
			router.start()
		}
		and
		given "应用服务发布端启动并注册到路由服务器", {
			service = new Service()
			serviceAdress = "192.168.10.10"
			service.start()
			service.register(serviceAdress)
		}
		and
		given "应用服务请求端启动并注册到路由服务器", {
			client = new Client()
			client.start()
			client.register()
			Assert.assertEquals(42.50, 4)
		}
		when "应用服务请求端获取发布端地址",{
			fetchAddress = client.fetchRouterAddress()
		}
		then "应用服务请求端获取正确的服务端地址",{
			fetchAddress.shouldBe(serviceAdress)
		}
}

/// 数据库
public struct database {
    
    struct today_news {
        /// 数据库服务器地址
        static let hostname = "182.92.83.11"
        /// 用户名
        static let username = "lovemo"
        /// 密码
        static let password = "perfect_swift"
        /// 数据库名
        static let database =  "today_news"
        /// 数据库表前缀
        static let dbprefix = ""
        /// 数据库端口号
        static let dbport = "27017"
        /// 数据库连接地址
        static let connection {
            return "mongodb://" +
                today_news.username  + ":" +
                today_news.password + "@" +
                today_news.hostname + ":" +
                today_news.dbport + "/"
        }
    }

    
}

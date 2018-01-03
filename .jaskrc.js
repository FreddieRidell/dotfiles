module.exports = {
	dataFolder: `/home/freddie/Sync/Files/JaskActions`,
	server: {
		port: 9000,
		key: "KErLEU1XJO3H9RUjGvLWmrSTGC5KGQVq9wguoOTP7B9U9bqYOJ72PbexKMdgLgjBOKgyjmFU0PYaus8qeDMrl55VL8xg0HS1QP08fV0IUzjbEtrOouDmP91iJaGoli4C",
	},
	client: {
		userHTTPServer: false,
		rendering: {
			//these will eventually be depricated, in favour of storing such things in the action store.
			//this will allow for universal cross clien config
			giveScore: ({ now, }) => ({ uuid, due, created, updated, done, tags, project, priority, }) => (
				( due ? Math.pow(10, ( ( now - due ) / 4320000000 ) + 1) : 0 )
				+
				( Math.pow(10, ( now - created ) / 22896000000 ) )
				+
				( Math.pow(10, ( now - updated ) / 22896000000 )  )
				+
				( priority ? ( ({ H: 10, M: 5, L: -2 })[priority] || 0 ) : 0 )
			),
			filterTask: ({ done, }) => !done,
			giveColor: ({ now, }) => ({ due, priority, }) => ([
				//use any color keywork from the chalk styling library:
				// [chalk](https://github.com/chalk/chalk)
				//any expressions that evaluate to false are ignored,
				//styled are applied in presidence from this order.
				(
					(now > due) 
					? {
						fn: "hex",
						val: "#f00",
					}
					: false
				),

				(
					priority
					? {
						fn: "keyword",
						val: ( ({ H: "green", M: "yellow", L: "grey", })[priority] ),
					}
					: false
				),
			]),
			headers: [
				"score",
				"id",
				"description",
				"due",
				"tags",
				"priority",
				"project",
				"depends",
				"recur",
			],
		}
	},
}

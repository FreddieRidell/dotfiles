module.exports = {
	dataFolder: `/home/freddie/Sync/Files/JaskActions`,
	server: {
		address: "46.101.73.224",
		port: 9000,
		key: "Dzg8nsjMLUlLA6XzsBD6SWC397azHgvxwkB60QYaC8uTL9d4UqMALF1HuuVgpqqEHUAOmYH6Z5HXSFrG4cMznIXLD0i74MJpFstUn9CpdB5nF7Ik6cU7OIHElh4Iy1Xw",
	},
	client: {
		userHTTPServer: false,
		rendering: {
			//these will eventually be depricated, in favour of storing such things in the action store.
			//this will allow for universal cross clien config
			giveScore: ({ now, }) => ({ uuid, due, start, stop, created, updated, done, tags, project, priority, }) => (
				( due ? Math.pow(10, ( ( now - due ) / 4320000000 ) + 1) : 0 )
				+
				( start > ( stop || 0 ) ? 50 : 0 )
				+
				( Math.pow(10, ( now - created ) / 22896000000 ) )
				+
				( Math.pow(10, ( now - updated ) / 22896000000 )  )
				+
				( priority ? ( ({ H: 10, M: 5, L: -2 })[priority] || 0 ) : 0 )
			),
			filterTask: ({ done, }) => !done,
			giveColor: ({ now, }) => ({ start, stop, due, priority, }) => ([
				//use any color keywork from the chalk styling library:
				// [chalk](https://github.com/chalk/chalk)
				//any expressions that evaluate to false are ignored,
				//styled are applied in presidence from this order.
				(
					//overdue
					( start > ( stop || 0 ) ? 30 : 0 )
					? {
						fn: "bgHex",
						val: "#0b0",
					}
					: false
				),

				(
					//overdue
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

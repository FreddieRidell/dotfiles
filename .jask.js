module.exports = {
	dataFolder: "/home/freddie/Sync/Files/Jask",

	columns: [
		"score",
		"i",
		"description",
		"due",
		"tags",
		"priority",
		"project",
		"depends",
		"recur",
		"created",
	],

	scoreFunction: ({ created, due, project, priority, tags, }) => {
		//const ageScore = differenceInDays(new Date(), created);
		const tagsCountScore = tags.length;
		//const dueInScore = due
			//? 10 * Math.exp(differenceInMinutes(new Date(), due) / 36000)
			//: 0;
		const projectScore = project ? 3 : 0;

		const priorityScore =
			{
				h: 10,
				m: 5,
				l: -2,
			}[priority] || 0;

		return ageScore + tagsCountScore + dueInScore + priorityScore + projectScore;
	},
};

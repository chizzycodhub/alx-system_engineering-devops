#include <stdio.h>   /*For input and output like 'printf'*/
#include <stdlib.h>  /*For general purpose function like 'exit'*/
#include <unistd.h>  /*For unix standard function like 'fork' and 'sleep'*/

/**
 * infinite_while - Runs an infinite loop that keeps the parent process running
 *
 * Return: Always 0 on sucess
 */
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}

	return (0);
}

/**
 * main - Creates 5 zombi process
 *
 * Return: Always 0
 */
int main(void)
{
	pid_t ZOMBI_PID;
	int i;

	for (i = 0; i < 5; i++)
	{
		ZOMBI_PID = fork();

		if (ZOMBI_PID > 0)
			printf("Zombie process created, PID: %d\n", ZOMBI_PID);

		else if (ZOMBI_PID == 0)
			exit(0);

		else
		{
			perror("fork");
			return (1);
		}
	}

	infinite_while();

	return (1);
}

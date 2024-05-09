#include <stdio.h>
void firstfit(int noProcess, int process[], int noBlock, int block[])
{
    int i, j, faults = 0, hit = 0, framehead = 0;
    allocation[noBlock];

    for (i = 0; i < noBlock; i++)
    {
        allocation[i] = -1;
    }

    for (i = 0; i < noProcess; i++)
    {
        for (j = 0; j < noBlock; j++)
        {
            if (block[j] >= process[i] && allocation[i] == -1)
            {
                allocation[i] = j;
                block[j] = 0;
            }
        }
    }
}

int main()
{
    int noProcess, noBlock;
    printf("Enter No of processes : ");
    scanf("%d", &noProcess);
    int process[noProcess];
    printf("Enter sequence of processes : ");
    for (int i = 0; i < noProcess; i++)
    {
        scanf("%d", &process[i]);
    }
    printf("Enter No of blocks : ");
    scanf("%d", &noBlock);
    int block[noBlock];
    printf("Enter sequence of processes : ");
    for (int i = 0; i < noBlock; i++)
    {
        scanf("%d", &block[i]);
    }
}

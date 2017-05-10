// DoorProblem.cpp : Defines the entry point for the console application.
// Created by: Sam Rice
// CompSci V19 - Computer Architechure
// Date (YYYYMMDD) - 20170510
// Time (HH:MM, 24hr) - 1536

#include "stdafx.h"
#include <stdlib.h>
#include <time.h>
#include <iostream>

struct door { bool isEmpty; };

int main()
{
	door one, two, three;
	int open = 0;
	double correct = 0;
	srand(time(NULL));
	do {
		for (int i = 0; i <= 100; i++)
		{
			one.isEmpty = true;
			two.isEmpty = true;
			three.isEmpty = true;
			switch (rand() % 3 + 1) //random number between 1 and 3, representing which door has the prize
			{
			case(1) : one.isEmpty = false;
				break;
			case(2) : two.isEmpty = false;
				break;
			case(3) : three.isEmpty = false;
				break;
			}
			switch (rand() % 3 + 1) //random number between 1 and 3, representing the 1st guessed door
			{
			case(1) :
				two.isEmpty ? open = 3 : open = 2;
				break;
			case(2) :
				three.isEmpty ? open = 1 : open = 3;
				break;
			case(3) :
				two.isEmpty ? open = 1 : open = 2;
				break;
			}
			switch (open) //which door did we open?
			{
			case (1) :
				if (!one.isEmpty)
					correct++;
				break;
			case (2) :
				if (!two.isEmpty)
					correct++;
				break;
			case (3) :
				if (!three.isEmpty)
					correct++;
				break;
			}
		}
		correct = correct / 100;
		std::cout << correct;
		std::cin >> correct; //if you type 0, then it will loop. Otherwise, it will exit
	} while (correct == 0);
    return 0;
}


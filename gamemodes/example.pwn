#include a_samp
#include zcmd

#define pLoad_Sound 2
#include pLoading

main(){}

new start, end;

public OnPlayerLoadingStart(playerid)
{
	start = gettime();
	return 1;
}

public OnPlayerLoadingEnd(playerid)
{
	end = gettime();
	
	printf("Time: %d", end - start);
	return 1;
}


CMD:load(playerid, params[])
{
	if(isnull(params)) SendClientMessage(playerid, -1, "/load <time>");
	else ShowPlayerLoading(playerid, strval(params));
	return 1;
}

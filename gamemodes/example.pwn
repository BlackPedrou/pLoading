#include	a_samp
#include 	zcmd
#include 	pLoading

main()
{
	print("Commands: /Load <time>  and  /Sounds");
}

new start, end;
public OnPlayerLoadingStart(playerid)
{
	start = gettime();
	return 1;
}

public OnPlayerLoadingEnd(playerid)
{
	end = gettime();
	
	printf("Time: %d", end -start);
	return 1;
}

CMD:load(playerid, params[])
{
	if(isnull(params)) SendClientMessage(playerid, -1, "/load <time>");
	else ShowPlayerLoading(playerid, strval(params));
	return 1;
}

CMD:sounds(playerid)
{
	ShowPlayerDialog(playerid, 741, DIALOG_STYLE_TABLIST_HEADERS, "pL_Sound",
	"Music\tTime\n\
	1. Music Oficial \t[01:39]\n\
	2. CJ's rap <English>\t[01:16]\n\
	3. Sample de Guitarra <Portuguese>\t[00:42]",
	"Select", "Cancel");
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(response && dialogid == 741)
	{
		pL_Loading[playerid][pL_Sound] = listitem;
		SendClientMessage(playerid, -1, "<+> Music changed successfully!");
	}
	return 1;
}

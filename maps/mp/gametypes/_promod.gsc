init() 
{
	level.serverDvars = [];
	setServerDvarDefault( "class_assault_limit", 64, 0, 64 );
	setServerDvarDefault( "class_specops_limit", 2, 0, 64 );
	setServerDvarDefault( "class_demolitions_limit", 1, 0, 64 );
	setServerDvarDefault( "class_sniper_limit", 1, 0, 64 );
	setDvarDefault( "class_assault_allowdrop", 1, 0, 1 );
	setDvarDefault( "class_specops_allowdrop", 1, 0, 1 );
	setDvarDefault( "class_demolitions_allowdrop", 0, 0, 1 );
	setDvarDefault( "class_sniper_allowdrop", 0, 0, 1 );
	setDvarDefault( "weap_allow_m16", 1, 0, 1 );
	setDvarDefault( "weap_allow_ak47", 1, 0, 1 );
	setDvarDefault( "weap_allow_m4", 1, 0, 1 );
	setDvarDefault( "weap_allow_g3", 1, 0, 1 );
	setDvarDefault( "weap_allow_g36c", 1, 0, 1 );
	setDvarDefault( "weap_allow_m14", 1, 0, 1 );
	setDvarDefault( "weap_allow_mp44", 1, 0, 1 );
	setDvarDefault( "attach_allow_assault_none", 1, 0, 1 );
	setDvarDefault( "attach_allow_assault_silencer", 1, 0, 1 );
	setDvarDefault( "weap_allow_mp5", 1, 0, 1 );
	setDvarDefault( "weap_allow_uzi", 1, 0, 1 );
	setDvarDefault( "weap_allow_ak74u", 1, 0, 1 );
	setDvarDefault( "attach_allow_specops_none", 1, 0, 1 );
	setDvarDefault( "attach_allow_specops_silencer", 1, 0, 1 );
	setDvarDefault( "weap_allow_m1014", 1, 0, 1 );
	setDvarDefault( "weap_allow_winchester1200", 1, 0, 1 );
	setDvarDefault( "weap_allow_m40a3", 1, 0, 1 );
	setDvarDefault( "weap_allow_remington700", 1, 0, 1 );
	setDvarDefault("weap_allow_knife", 1, 0, 1);
	setServerDvarDefault("weap_allow_knife", 1, 0, 1);
	setServerDvarDefault( "weap_allow_beretta", 1, 0, 1 );
	setServerDvarDefault( "weap_allow_colt45", 1, 0, 1 );
	setServerDvarDefault( "weap_allow_usp", 1, 0, 1 );
	setServerDvarDefault( "weap_allow_deserteagle", 1, 0, 1 );
	setServerDvarDefault( "weap_allow_deserteaglegold", 1, 0, 1 );
	setServerDvarDefault( "attach_allow_pistol_none", 1, 0, 1 );
	setServerDvarDefault( "attach_allow_pistol_silencer", 1, 0, 1 );
	setServerDvarDefault( "weap_allow_frag_grenade", 1, 0, 1 );
	setServerDvarDefault( "weap_allow_flash_grenade", 1, 0, 1 );
	setServerDvarDefault( "weap_allow_smoke_grenade", 1, 0, 1 );
	setServerDvarDefault( "allies_allow_assault", 1, 0, 1 );
	setServerDvarDefault( "allies_allow_specops", 1, 0, 1 );
	setServerDvarDefault( "allies_allow_demolitions", 1, 0, 1 );
	setServerDvarDefault( "allies_allow_sniper", 1, 0, 1 );
	setServerDvarDefault( "axis_allow_assault", 1, 0, 1 );
	setServerDvarDefault( "axis_allow_specops", 1, 0, 1 );
	setServerDvarDefault( "axis_allow_demolitions", 1, 0, 1 );
	setServerDvarDefault( "axis_allow_sniper", 1, 0, 1 );
	setDvarDefault( "class_assault_primary", "ak47" );
	setDvarDefault( "class_assault_primary_attachment", "none" );
	setDvarDefault( "class_assault_secondary", "deserteagle" );
	setDvarDefault( "class_assault_secondary_attachment", "none" );
	setDvarDefault( "class_assault_grenade", "smoke_grenade" );
	setDvarDefault( "class_assault_camo", "camo_none" );
	setDvarDefault( "class_specops_primary", "ak74u" );
	setDvarDefault( "class_specops_primary_attachment", "none" );
	setDvarDefault( "class_specops_secondary", "deserteagle" );
	setDvarDefault( "class_specops_secondary_attachment", "none" );
	setDvarDefault( "class_specops_grenade", "smoke_grenade" );
	setDvarDefault( "class_specops_camo", "camo_none" );
	setDvarDefault( "class_demolitions_primary", "winchester1200" );
	setDvarDefault( "class_demolitions_primary_attachment", "none" );
	setDvarDefault( "class_demolitions_secondary", "deserteagle" );
	setDvarDefault( "class_demolitions_secondary_attachment", "none" );
	setDvarDefault( "class_demolitions_grenade", "smoke_grenade" );
	setDvarDefault( "class_demolitions_camo", "camo_none" );
	setDvarDefault( "class_sniper_primary", "m40a3" );
	setDvarDefault( "class_sniper_primary_attachment", "none" );
	setDvarDefault( "class_sniper_secondary", "deserteagle" );
	setDvarDefault( "class_sniper_secondary_attachment", "none" );
	setDvarDefault( "class_sniper_grenade", "smoke_grenade" );
	setDvarDefault( "class_sniper_camo", "camo_none" );
	setDvarDefault( "scr_enable_hiticon", 2, 0, 2 );
	setDvarDefault( "scr_enable_scoretext", 1, 0, 1 );
	level thread onPlayerConnect();
}

onPlayerConnect()
{
	for(;;)
	{
		level waittill( "connecting", player );
		player thread updateServerDvars();
	}
}

setClassChoice( classType )
{
	if( classType != "assault" && classType != "specops" && classType != "demolitions" && classType != "sniper" )
		return;
	
	self.pers["class"] = classType;
	self.class = classType;
	self setClientDvar( "loadout_class", classType );
	self initClassLoadouts();
	self setDvarsFromClass( classType );
	switch ( classType )
	{
		case "assault": self setClientDvars( "weap_allow_m16", getDvar( "weap_allow_m16" ), "weap_allow_ak47", getDvar( "weap_allow_ak47" ), "weap_allow_m4", getDvar( "weap_allow_m4" ), "weap_allow_g3", getDvar( "weap_allow_g3" ), "weap_allow_g36c", getDvar( "weap_allow_g36c" ), "weap_allow_m14", getDvar( "weap_allow_m14" ), "weap_allow_mp44", getDvar( "weap_allow_mp44" ), "attach_allow_assault_none", getDvar( "attach_allow_assault_none" ), "attach_allow_assault_silencer", getDvar( "attach_allow_assault_silencer" ) );
			break;
		case "specops": self setClientDvars( "weap_allow_mp5", getDvar( "weap_allow_mp5" ), "weap_allow_uzi", getDvar( "weap_allow_uzi" ), "weap_allow_ak74u", getDvar( "weap_allow_ak74u" ), "attach_allow_specops_none", getDvar( "attach_allow_specops_none" ), "attach_allow_specops_silencer", getDvar( "attach_allow_specops_silencer" ) );
			break;
		case "demolitions": self setClientDvars( "weap_allow_m1014", getDvar( "weap_allow_m1014" ), "weap_allow_winchester1200", getDvar( "weap_allow_winchester1200" ) );
			break;
		case "sniper": self setClientDvars( "weap_allow_m40a3", getDvar( "weap_allow_m40a3" ), "weap_allow_remington700", getDvar( "weap_allow_remington700" ) );
			break;
	}
	thread updateClassAvailability( self.pers["team"] );
}

setDvarWrapper( dvarName, setVal )
{
	setDvar( dvarName, setVal );
	if ( isDefined( level.serverDvars[dvarName] ) )
	{
		level.serverDvars[dvarName] = setVal;
		for ( i = 0;i < level.players.size;i++ )
		level.players[i] setClientDvar( dvarName, setVal );
	}
}

setDvarDefault( dvarName, setVal, minVal, maxVal )
{
	if ( getDvar( dvarName ) != "" )
	{
		if ( isString( setVal ) ) setVal = getDvar( dvarName );
		else setVal = getDvarFloat( dvarName );
	}
	if ( isDefined( minVal ) && !isString( setVal ) ) setVal = max( setVal, minVal );
	if ( isDefined( maxVal ) && !isString( setVal ) ) setVal = min( setVal, maxVal );
	setDvar( dvarName, setVal );
	return setVal;
}

setServerDvarDefault( dvarName, setVal, minVal, maxVal )
{
	setVal = setDvarDefault( dvarName, setVal, minVal, maxVal );
	level.serverDvars[dvarName] = setVal;
}

initClassLoadouts()
{
	self endon ("disconnect");
	wait 0.05;
	self initLoadoutForClass( "assault" );
	self initLoadoutForClass( "specops" );
	self initLoadoutForClass( "demolitions" );
	self initLoadoutForClass( "sniper" );
}

initLoadoutForClass( classType )
{
	SSALC = "";
	if ( classType == "assault" ) SSALC = "ASSAULT";
	else if ( classType == "specops" ) SSALC = "SPECOPS";
	else if ( classType == "demolitions" ) SSALC = "DEMOLITIONS";
	else if ( classType == "sniper" ) SSALC = "SNIPER";
	CLASS_PRIMARY = SSALC + "_PRIMARY";
	CLASS_PRIMARY_ATTACHMENT = SSALC + "_PRIMARY_ATTACHMENT";
	CLASS_SECONDARY = SSALC + "_SECONDARY";
	CLASS_SECONDARY_ATTACHMENT = SSALC + "_SECONDARY_ATTACHMENT";
	CLASS_GRENADE = SSALC + "_GRENADE";
	CLASS_CAMO = SSALC + "_CAMO";
	if ( !isDefined( self.pers[classType] ) || !isDefined( self.pers[classType]["loadout_primary"] ) )
	{
		if ( validClass( classType, get_config( CLASS_PRIMARY ), "loadout_primary" ) ) self.pers[classType]["loadout_primary"] = get_config( CLASS_PRIMARY );
		else self.pers[classType]["loadout_primary"] = getDvar( "class_" + classType + "_primary" );
	}
	if ( !isDefined( self.pers[classType] ) || !isDefined( self.pers[classType]["loadout_primary_attachment"] ) )
	{
		if ( validClass( classType, get_config( CLASS_PRIMARY_ATTACHMENT ), "loadout_primary_attachment" ) ) self.pers[classType]["loadout_primary_attachment"] = get_config( CLASS_PRIMARY_ATTACHMENT );
		else self.pers[classType]["loadout_primary_attachment"] = getDvar( "class_" + classType + "_primary_attachment" );
	}
	if ( !isDefined( self.pers[classType] ) || !isDefined( self.pers[classType]["loadout_secondary"] ) )
	{
		if ( validClass( classType, get_config( CLASS_SECONDARY ), "loadout_secondary" ) ) self.pers[classType]["loadout_secondary"] = get_config( CLASS_SECONDARY );
		else self.pers[classType]["loadout_secondary"] = getDvar( "class_" + classType + "_secondary" );
	}
	if ( !isDefined( self.pers[classType] ) || !isDefined( self.pers[classType]["loadout_secondary_attachment"] ) )
	{
		if ( validClass( classType, get_config( CLASS_SECONDARY_ATTACHMENT ), "loadout_secondary_attachment" ) ) self.pers[classType]["loadout_secondary_attachment"] = get_config( CLASS_SECONDARY_ATTACHMENT );
		else self.pers[classType]["loadout_secondary_attachment"] = getDvar( "class_" + classType + "_secondary_attachment" );
	}
	if ( !isDefined( self.pers[classType] ) || !isDefined( self.pers[classType]["loadout_grenade"] ) )
	{
		if ( validClass( classType, get_config( CLASS_GRENADE ), "loadout_grenade" ) ) self.pers[classType]["loadout_grenade"] = get_config( CLASS_GRENADE );
		else self.pers[classType]["loadout_grenade"] = getDvar( "class_" + classType + "_grenade" );
	}
	if ( !isDefined( self.pers[classType] ) || !isDefined( self.pers[classType]["loadout_camo"] ) )
	{
		if ( validClass( classType, get_config( CLASS_CAMO ), "loadout_camo" ) ) self.pers[classType]["loadout_camo"] = get_config( CLASS_CAMO );
		else self.pers[classType]["loadout_camo"] = getDvar( "class_" + classType + "_camo" );
	}
}
validClass( classType, preServed, type )
{
	if ( preServed == "" ) return false;
	loadout_primary = "";
	loadout_primary_attachment = "";
	loadout_secondary = "";
	loadout_secondary_attachment = "";
	loadout_grenade = "";
	loadout_camo = "";
	if ( classType == "assault" ) loadout_primary = strTok( "m16,ak47,m4,g3,g36c,m14,mp44", "," );
	else if ( classType == "specops" ) loadout_primary = strTok( "mp5,uzi,ak74u", "," );
	else if ( classType == "demolitions" ) loadout_primary = strTok( "winchester1200,m1014", "," );
	else if ( classType == "sniper" ) loadout_primary = strTok( "m40a3,remington700", "," );
	loadout_primary_attachment = strTok( "none,silencer", "," );
	loadout_secondary = strTok("deserteaglegold,deserteagle,colt45,usp,beretta,knife", ",");
	loadout_secondary_attachment = strTok( "none,silencer", "," );
	loadout_grenade = strTok( "flash_grenade,smoke_grenade", "," );
	loadout_camo = strTok( "camo_none,camo_brockhaurd,camo_bushdweller,camo_blackwhitemarpat,camo_tigerred,camo_stagger,camo_gold", "," );
	switch ( type )
	{
		case "loadout_primary":
			for ( i = 0; i < loadout_primary.size; i++ )
			{
				exp = loadout_primary[i];
				if ( exp == preServed ) if ( getDvarInt( "weap_allow_" + preServed ) ) return true;
			}
			break;
		case "loadout_primary_attachment":
			if ( classType == "assault" || classType == "specops" )
			{
				for ( i = 0; i < loadout_primary_attachment.size; i++ )
				{
					exp = loadout_primary_attachment[i];
					if ( exp == preServed ) if ( getDvarInt( "attach_allow" + "_" + classType + "_" + preServed ) ) return true;
				}
			}
			break;
		case "loadout_secondary":
			for ( i = 0; i < loadout_secondary.size; i++ )
			{
				exp = loadout_secondary[i];
				if ( exp == preServed ) if ( getDvarInt( "weap_allow_" + preServed ) ) return true;
			}
			break;
		case "loadout_secondary_attachment":
			for ( i = 0; i < loadout_secondary_attachment.size; i++ )
			{
				exp = loadout_secondary_attachment[i];
				if ( exp == preServed ) if ( getDvarInt( "attach_allow_pistol_" + preServed ) ) return true;
			}
			break;
		case "loadout_grenade":
			for ( i = 0; i < loadout_grenade.size; i++ )
			{
				exp = loadout_grenade[i];
				if ( exp == preServed ) if ( getDvarInt( "weap_allow_" + preServed ) ) return true;
			}
			break;
		case "loadout_camo":
			for ( i = 0; i < loadout_camo.size; i++ )
			{
				exp = loadout_camo[i];
				if ( exp == preServed ) return true;
			}
			break;
		default: return false;
	}
	return false;
}

setDvarsFromClass( classType )
{
	self setClientDvars(
		"loadout_primary", self.pers[classType]["loadout_primary"],
		"loadout_primary_attachment", self.pers[classType]["loadout_primary_attachment"],
		"loadout_secondary", self.pers[classType]["loadout_secondary"],
		"loadout_secondary_attachment", self.pers[classType]["loadout_secondary_attachment"],
		"loadout_grenade", self.pers[classType]["loadout_grenade"],
		"loadout_camo", self.pers[classType]["loadout_camo"] );
}

processLoadoutResponse( respString )
{
	if ( !isDefined( self.pers["class"] ) ) return;
	commandTokens = strTok( respString, "," );
	for ( i = 0; i < commandTokens.size; i++ )
	{
		subTokens = strTok( commandTokens[i], ":" );
		if( subTokens.size < 2 ) return;
		switch ( subTokens[0] )
		{
			case "loadout_primary":
			case "loadout_secondary":
			if ( respString != "loadout_primary:m16" && respString != "loadout_primary:ak47" && respString != "loadout_primary:m4" && respString != "loadout_primary:g3" && respString != "loadout_primary:g36c" && respString != "loadout_primary:m14" && respString != "loadout_primary:mp44" && respString != "loadout_primary:mp5" && respString != "loadout_primary:uzi" && respString != "loadout_primary:ak74u" && respString != "loadout_primary:winchester1200" && respString != "loadout_primary:m1014" && respString != "loadout_primary:m40a3" && respString != "loadout_primary:remington700" && respString != "loadout_secondary:deserteaglegold" && respString != "loadout_secondary:deserteagle" && respString != "loadout_secondary:colt45" && respString != "loadout_secondary:usp" && respString != "loadout_secondary:beretta" ) return;
			if ( getDvarInt( "weap_allow_" + subTokens[1] ) && self verifyWeaponChoice( subTokens[1], self.class ) )
			{
				self.pers[self.class][subTokens[0]] = subTokens[1];
				self setClientDvar( subTokens[0], subTokens[1] );
				if ( subTokens[1] == "mp44" )
				{
					self.pers[self.class]["loadout_primary_attachment"] = "none";
					self setClientDvar( "loadout_primary_attachment", "none" );
				}
				else if ( subTokens[1] == "deserteagle" || subTokens[1] == "deserteaglegold" )
				{
					self.pers[self.class]["loadout_secondary_attachment"] = "none";
					self setClientDvar( "loadout_secondary_attachment", "none" );
				}
			}
			else self setClientDvar( subTokens[0], self.pers[self.class][subTokens[0]] );
			break;
			case "loadout_primary_attachment":
			case "loadout_secondary_attachment":
			if( respString != "loadout_primary_attachment:assault:none" && respString != "loadout_primary_attachment:assault:silencer" && respString != "loadout_primary_attachment:specops:none" && respString != "loadout_primary_attachment:specops:silencer" && respString != "loadout_secondary_attachment:pistol:none" && respString != "loadout_secondary_attachment:pistol:silencer" ) return;
			if ( subTokens[0] == "loadout_primary_attachment" && self.pers[self.class]["loadout_primary"] == "mp44" )
			{
				self.pers[self.class]["loadout_primary_attachment"] = "none";
				self setClientDvar( "loadout_primary_attachment", "none" );
			}
			else if ( getDvarInt( "attach_allow_" + subTokens[1] + "_" + subTokens[2] ) )
			{
				self.pers[self.class][subTokens[0]] = subTokens[2];
				self setClientDvar( subTokens[0], subTokens[2] );
			}
			else self setClientDvar( subTokens[0], self.pers[self.class][subTokens[0]] );
			break;
			case "loadout_grenade":
			if( respString != "loadout_grenade:flash_grenade" && respString != "loadout_grenade:smoke_grenade" ) return;
			if ( getDvarInt( "weap_allow_" + subTokens[1] ) )
			{
				self.pers[self.class][subTokens[0]] = subTokens[1];
				self setClientDvar( subTokens[0], subTokens[1] );
			}
			else self setClientDvar( subTokens[0], self.pers[self.class][subTokens[0]] );
			break;
			case "loadout_camo": switch ( subTokens[1] )
			{
				case "camo_none":
				case "camo_brockhaurd":
				case "camo_bushdweller":
				case "camo_blackwhitemarpat":
				case "camo_tigerred":
				case "camo_stagger":
				case "camo_gold":
				self.pers[self.class][subTokens[0]] = subTokens[1];
				break;
				default: return;
			} 
		}
	}
}

verifyWeaponChoice( weaponName, classType )
{
	if ( tableLookup( "mp/statsTable.csv", 4, weaponName, 2 ) == "weapon_pistol" ) return true;
	switch ( classType )
	{
		case "assault":
		case "sniper":
		if ( tableLookup( "mp/statsTable.csv", 4, weaponName, 2 ) == "weapon_"+classType ) return true;
		break;
		case "specops":
		if ( tableLookup( "mp/statsTable.csv", 4, weaponName, 2 ) == "weapon_smg" ) return true;
		break;
		case "demolitions":
		if ( tableLookup( "mp/statsTable.csv", 4, weaponName, 2 ) == "weapon_shotgun" ) return true;
		break;
	}
	return false;
}

verifyClassChoice( teamName, classType )
{
	if ( teamName == "allies" || teamName == "axis" )
	{
		if ( isDefined( self.pers["class"] ) && self.pers["class"] == classType ) return true;
		game[teamName + "_" + classType + "_count"] = 0;
		for ( i = 0; i < level.players.size; i++ ) if ( level.players[i].team == teamName && isDefined( level.players[i].class ) && level.players[i].class == classType ) game[teamName + "_" + classType + "_count"]++; return ( game[teamName + "_" + classType + "_count"] < getDvarInt( "class_" + classType + "_limit" ) );
	}
	return false;
}

updateClassAvailability( teamName )
{
	game[teamName + "_assault_count"] = 0;
	game[teamName + "_specops_count"] = 0;
	game[teamName + "_demolitions_count"] = 0;
	game[teamName + "_sniper_count"] = 0;
	for ( i = 0; i < level.players.size; i++ )
	{
		player = level.players[i];
		if ( player.team == teamName && isDefined( player.class ) && player.class == "assault" ) game[teamName + "_assault_count"]++;
		if ( player.team == teamName && isDefined( player.class ) && player.class == "specops" ) game[teamName + "_specops_count"]++;
		if ( player.team == teamName && isDefined( player.class ) && player.class == "demolitions" ) game[teamName + "_demolitions_count"]++;
		if ( player.team == teamName && isDefined( player.class ) && player.class == "sniper" ) game[teamName + "_sniper_count"]++;
	}
	setDvarWrapper( teamName + "_allow_assault", game[teamName + "_assault_count"] < getDvarInt( "class_assault_limit" ) );
	setDvarWrapper( teamName + "_allow_specops", game[teamName + "_specops_count"] < getDvarInt( "class_specops_limit" ) );
	setDvarWrapper( teamName + "_allow_demolitions", game[teamName + "_demolitions_count"] < getDvarInt( "class_demolitions_limit" ) );
	setDvarWrapper( teamName + "_allow_sniper", game[teamName + "_sniper_count"] < getDvarInt( "class_sniper_limit" ) );
	thread updatemenu(teamName);
}

updatemenu(team)
{
	players=getEntArray("player","classname");
	for(i=0;i<players.size;i++)
	{
		if(players[i].pers["team"]!=team )continue;
		players[i] setclientdvar("class_sniper_left",getDvarInt("class_sniper_limit")-game[team+"_sniper_count"]);
		players[i] setclientdvar("class_specops_left", getDvarInt( "class_specops_limit" ) -game[team + "_specops_count"]);
		players[i] setclientdvar("class_demolitions_left", getDvarInt( "class_demolitions_limit" ) -game[team+"_demolitions_count"]);
		players[i] setclientdvar("class_assault_left",getDvarInt("class_assault_limit")-game[team+"_assault_count"]);
	}
}

menuAcceptClass( response )
{ 
	if ( ( isDefined( response) && response == "apply" && isDefined( game["PROMOD_MATCH_MODE"] ) && game["PROMOD_MATCH_MODE"] == "pub" ) || !isDefined(self.pers["class"]) ) return;
	if ( isDefined( response ) && response == "go" ) self maps\mp\gametypes\_globallogic::closeMenus();
	if ( !isDefined( self.pers["team"] ) || ( self.pers["team"] != "allies" && self.pers["team"] != "axis" ) ) return;
	if ( self.sessionstate == "playing" )
	{
		if ( level.inGracePeriod && isDefined( self.hasDoneCombat ) && !self.hasDoneCombat && isDefined( game["PROMOD_KNIFEROUND"] ) && !game["PROMOD_KNIFEROUND"] || isDefined( game["PROMOD_MATCH_MODE"] ) && game["PROMOD_MATCH_MODE"] == "strat" || isDefined( level.rdyup ) && level.rdyup || isDefined( level.strat_over ) && !level.strat_over ) self maps\mp\gametypes\_class::giveLoadout( self.pers["team"], self.pers["class"] );
		else
		{
			if ( !isDefined( response) || response != "apply" ) self iprintlnbold( game["strings"]["change_class"] );
			self setClientDvar( "loadout_curclass", self.pers["class"] );
		}
		if ( isDefined( response) && response == "go" ) self thread maps\mp\gametypes\_class::preserveClass( self.pers["class"] );
	}
	else
	{
		self setClientDvar( "loadout_curclass", self.pers["class"] );
		if ( isDefined( response) && response == "go" ) self thread maps\mp\gametypes\_class::preserveClass( self.pers["class"] );
		if ( isDefined( game["state"] ) && game["state"] == "postgame" ) return;
		if ( isDefined( game["state"] ) && game["state"] == "playing" ) self thread [[level.spawnClient]]();
	}
	self thread maps\mp\gametypes\_spectating::setSpectatePermissions();
}

updateServerDvars()
{
	self endon ( "disconnect" );
	dvarKeys = getArrayKeys( level.serverDvars );
	for ( i = 0; i < dvarKeys.size; i++ )
	{
		self setClientDvar( dvarKeys[i], level.serverDvars[dvarKeys[i]] );
		wait 0.05;
	}
}

get_config( dataName )
{
	self.dataValue = self getStat( int( tableLookup( "promod/customStatsTable.csv", 1, dataName, 0 ) ) );
	self.dataString = tablelookup( "promod/customStatsTable.csv", 0, self.dataValue, 1 );
	return self.dataString;
}
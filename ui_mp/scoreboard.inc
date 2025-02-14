#undef CHOICE_Y_SPACING
#define CHOICE_Y_SPACING		20

#define SCOREBOARD_MENU( itemIndex, textArg, colorArg, visArg ) \
itemDef \
{ \
	type			ITEM_TYPE_BUTTON \
	rect			CHOICE_RECT( itemIndex ) \
	exp				text( textArg ); \
	textfont		CHOICE_TEXTFONT \
	textscale		TEXTSIZE_SMALL \
	textstyle		CHOICE_TEXTSTYLE \
	textAlign		CHOICE_TEXTALIGN \
	textAlignX		CHOICE_TEXT_OFFSET_X \
	forecolor		0.1 0.3 1 1 \
	visible			when( team( name ) == "TEAM_FREE" && visArg ) \
	decoration \
} \

#define SCOREBOARD_TITLE( itemIndex, titleArg ) \
itemDef \
{ \
	style			WINDOW_STYLE_SHADER \
	rect			(SECTION_X_OFFSET+40) 7 180 0.5 CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN \
	origin			CHOICE_ORIGIN( itemIndex ) \
	background		"white" \ 
	forecolor		0.1 0.3 1 1 \
	visible			when( team( name ) == "TEAM_FREE" ) \
	decoration \
} \
itemDef \
{ \
	style			WINDOW_STYLE_SHADER \
	rect			(SECTION_X_OFFSET+40) 8 180 10 CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN \
	origin			CHOICE_ORIGIN( itemIndex ) \
	background		"white" \
	forecolor		0 0 0.8 0.8\
	visible			when( team( name ) == "TEAM_FREE" ) \
	decoration \
} \
itemDef \
{ \
	style			WINDOW_STYLE_SHADER \
	rect			(SECTION_X_OFFSET+40) 19 180 0.5 CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN \
	origin			CHOICE_ORIGIN( itemIndex ) \
	background		"white" \
	forecolor		1 1 1 0.85 \
	visible			when( team( name ) == "TEAM_FREE" ) \
	decoration \
} \
itemDef \
{ \
	type			ITEM_TYPE_TEXT \
	rect			(SECTION_X_OFFSET+150) -1 240 24 CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN \
	origin			CHOICE_ORIGIN( itemIndex ) \
	forecolor		1 1 1 0.8 \
	exp				text( titleArg );\
	textstyle		ITEM_TEXTSTYLE_SHADOWED \
	textfont		UI_FONT_NORMAL \
	textscale		TEXTSIZE_SMALL \
	textstyle		CHOICE_TEXTSTYLE \
	textAlign		ITEM_ALIGN_MIDDLE_LEFT \
	textAlignX		SECTION_TEXT_OFFSET_X \
	visible			when( team( name ) == "TEAM_FREE" ) \
	decoration \
}
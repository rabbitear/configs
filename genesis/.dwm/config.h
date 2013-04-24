/* woddfellow2's dwm Config
   by woddfellow2 | http://wlair.us.to/ */

#include "bstack.c"
#include "bstackhoriz.c"

// Appearance ------------------------------------------------------------------
static const char font[] = "-*-terminus-medium-r-*-*-12-*-*-*-*-*-*-*";

static const char normbordercolor[] = "#222222";
static const char normbgcolor[] = "#050505";
static const char normfgcolor[] = "#CCCCCC";
static const char selbordercolor[] = "#2255FF";
static const char selbgcolor[] = "#2255FF";
static const char selfgcolor[] = "#FFFFFF";

static const unsigned int borderpx = 1;
static const unsigned int snap = 16;

static const Bool showbar = True;
static const Bool topbar = True;

// Tagging ---------------------------------------------------------------------
static const char *tags[] =
{
	"term",
	"www",
	"gvim",
	"media",
	"vm",
	"other"
};

// Excuse all the QEMU spam, but they all have different classes:
static const Rule rules[] =
{
	{ "URxvt", NULL, NULL, 1 << 0, False, -1 },
	{ "Gimp", NULL, NULL, 1 << 5, True, -1 },
	{ "Firefox", NULL, NULL, 1 << 1, False, -1 },
	{ "Gvim", NULL, NULL, 1 << 2, False, -1 },
	{ "feh", NULL, NULL, 1 << 3, False, -1 },
	{ "Display", NULL, NULL, 1 << 3, True, -1 },
	{ "MPlayer", NULL, NULL, 1 << 3, False, -1 },
	{ "VirtualBox", NULL, NULL, 1 << 4, False, -1 },
	{ "qemu-system-alpha", NULL, NULL, 1 << 4, True, -1 },
	{ "qemu-system-arm", NULL, NULL, 1 << 4, True, -1 },
	{ "qemu-system-cris", NULL, NULL, 1 << 4, True, -1 },
	{ "qemu-system-i386", NULL, NULL, 1 << 4, True, -1 },
	{ "qemu-system-lm32", NULL, NULL, 1 << 4, True, -1 },
	{ "qemu-system-m68k", NULL, NULL, 1 << 4, True, -1 },
	{ "qemu-system-microblaze", NULL, NULL, 1 << 4, True, -1 },
	{ "qemu-system-microblazeel", NULL, NULL, 1 << 4, True, -1 },
	{ "qemu-system-mips", NULL, NULL, 1 << 4, True, -1 },
	{ "qemu-system-mips64", NULL, NULL, 1 << 4, True, -1 },
	{ "qemu-system-mips64el", NULL, NULL, 1 << 4, True, -1 },
	{ "qemu-system-mipsel", NULL, NULL, 1 << 4, True, -1 },
	{ "qemu-system-or32", NULL, NULL, 1 << 4, True, -1 },
	{ "qemu-system-ppc", NULL, NULL, 1 << 4, True, -1 },
	{ "qemu-system-ppc64", NULL, NULL, 1 << 4, True, -1 },
	{ "qemu-system-ppcemb", NULL, NULL, 1 << 4, True, -1 },
	{ "qemu-system-s390x", NULL, NULL, 1 << 4, True, -1 },
	{ "qemu-system-sh4", NULL, NULL, 1 << 4, True, -1 },
	{ "qemu-system-sh4eb", NULL, NULL, 1 << 4, True, -1 },
	{ "qemu-system-sparc", NULL, NULL, 1 << 4, True, -1 },
	{ "qemu-system-sparc64", NULL, NULL, 1 << 4, True, -1 },
	{ "qemu-system-unicore32", NULL, NULL, 1 << 4, True, -1 },
	{ "qemu-system-x86_64", NULL, NULL, 1 << 4, True, -1 },
	{ "qemu-system-xtensa", NULL, NULL, 1 << 4, True, -1 },
	{ "qemu-system-xtensaeb", NULL, NULL, 1 << 4, True, -1 },
	{ NULL, NULL, NULL, 1 << 5, False, -1 },
};

// Layouts ---------------------------------------------------------------------
static const float mfact = 0.50;
static const int nmaster = 1;
static const Bool resizehints = True;

static const Layout layouts[] =
{
	{ "[]=", tile },
	{ "><>", NULL },
	{ "[M]", monocle },
	{ "TTT", bstack },
	{ "===", bstackhoriz },
};

// Keybindings -----------------------------------------------------------------
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY, KEY, view, {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask, KEY, toggleview, {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask, KEY, tag, {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY, toggletag, {.ui = 1 << TAG} },

#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

// Commands
static const char *dmenucmd[] =
{
	"dmenu_run", "-fn", font, "-nb", normbgcolor, "-nf", normfgcolor, "-sb",
	selbgcolor, "-sf", selfgcolor, NULL
};

static Key keys[] =
{
	{ MODKEY, XK_p, spawn, {.v = dmenucmd } },
	{ MODKEY|ShiftMask, XK_Return, spawn, SHCMD("urxvtc") },
	{ MODKEY, XK_b, togglebar, {0} },
	{ MODKEY, XK_j, focusstack, {.i = +1 } },
	{ MODKEY, XK_k, focusstack, {.i = -1 } },
	{ MODKEY, XK_i, incnmaster, {.i = +1 } },
	{ MODKEY, XK_d, incnmaster, {.i = -1 } },
	{ MODKEY, XK_h, setmfact, {.f = -0.01} },
	{ MODKEY, XK_l, setmfact, {.f = +0.01} },
	{ MODKEY, XK_Return, zoom, {0} },
	{ MODKEY, XK_Tab, view, {0} },
	{ MODKEY|ShiftMask, XK_c, killclient, {0} },
	{ MODKEY, XK_m, setlayout, {.v = &layouts[2]} },
	{ MODKEY, XK_t, setlayout, {.v = &layouts[0]} },
	{ MODKEY, XK_f, setlayout, {.v = &layouts[1]} },
	{ MODKEY, XK_space, setlayout, {0} },
	{ MODKEY|ShiftMask, XK_space, togglefloating, {0} },
	{ MODKEY, XK_0, view, {.ui = ~0 } },
	{ MODKEY|ShiftMask, XK_0, tag, {.ui = ~0 } },
	{ MODKEY, XK_comma, focusmon, {.i = -1 } },
	{ MODKEY, XK_period, focusmon, {.i = +1 } },
	{ MODKEY|ShiftMask, XK_comma, tagmon, {.i = -1 } },
	{ MODKEY|ShiftMask, XK_period, tagmon, {.i = +1 } },
	TAGKEYS(XK_1, 0)
	TAGKEYS(XK_2, 1)
	TAGKEYS(XK_3, 2)
	TAGKEYS(XK_4, 3)
	TAGKEYS(XK_5, 4)
	TAGKEYS(XK_6, 5)
	TAGKEYS(XK_7, 6)
	TAGKEYS(XK_8, 7)
	TAGKEYS(XK_9, 8)
	{ MODKEY|ShiftMask, XK_q, quit, {0} },

	// Custom Keybindings
	{ MODKEY|ShiftMask, XK_t, setlayout, {.v = &layouts[3]} },
	{ MODKEY|ControlMask, XK_t, setlayout, {.v = &layouts[4]} },
	{ MODKEY, XK_Escape, spawn, SHCMD("slock") },
	{ MODKEY, XK_x, spawn, SHCMD("banish") },
	{ MODKEY|ShiftMask, XK_f, spawn, SHCMD("firefox") },
};

// Mouse Bindings --------------------------------------------------------------
static Button buttons[] =
{
	{ ClkClientWin, MODKEY, Button1, movemouse, {0} },
	{ ClkClientWin, MODKEY, Button3, resizemouse, {0} },
};

// vim: ft=c

void banish()
{
	XWarpPointer(dpy, None, RootWindow(dpy, DefaultScreen(dpy)),
		0, 0, 0, 0, XDisplayWidth(dpy, DefaultScreen(dpy)),
		XDisplayHeight(dpy, DefaultScreen(dpy)));
}

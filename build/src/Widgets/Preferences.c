/* Preferences.c generated by valac 0.24.0, the Vala compiler
 * generated from Preferences.vala, do not modify */


#include <glib.h>
#include <glib-object.h>
#include <gtk/gtk.h>


#define YATLA_TYPE_PREFERENCES (yatla_preferences_get_type ())
#define YATLA_PREFERENCES(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), YATLA_TYPE_PREFERENCES, YatlaPreferences))
#define YATLA_PREFERENCES_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), YATLA_TYPE_PREFERENCES, YatlaPreferencesClass))
#define YATLA_IS_PREFERENCES(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), YATLA_TYPE_PREFERENCES))
#define YATLA_IS_PREFERENCES_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), YATLA_TYPE_PREFERENCES))
#define YATLA_PREFERENCES_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), YATLA_TYPE_PREFERENCES, YatlaPreferencesClass))

typedef struct _YatlaPreferences YatlaPreferences;
typedef struct _YatlaPreferencesClass YatlaPreferencesClass;
typedef struct _YatlaPreferencesPrivate YatlaPreferencesPrivate;

struct _YatlaPreferences {
	GtkDialog parent_instance;
	YatlaPreferencesPrivate * priv;
};

struct _YatlaPreferencesClass {
	GtkDialogClass parent_class;
};


static gpointer yatla_preferences_parent_class = NULL;

GType yatla_preferences_get_type (void) G_GNUC_CONST;
enum  {
	YATLA_PREFERENCES_DUMMY_PROPERTY
};
YatlaPreferences* yatla_preferences_new (void);
YatlaPreferences* yatla_preferences_construct (GType object_type);


YatlaPreferences* yatla_preferences_construct (GType object_type) {
	YatlaPreferences * self = NULL;
	self = (YatlaPreferences*) g_object_new (object_type, NULL);
	gtk_window_set_title ((GtkWindow*) self, "Preferences");
	gtk_container_set_border_width ((GtkContainer*) self, (guint) 5);
	gtk_window_set_resizable ((GtkWindow*) self, FALSE);
	g_object_set ((GtkWindow*) self, "window-position", GTK_WIN_POS_CENTER, NULL);
	return self;
}


YatlaPreferences* yatla_preferences_new (void) {
	return yatla_preferences_construct (YATLA_TYPE_PREFERENCES);
}


static void yatla_preferences_class_init (YatlaPreferencesClass * klass) {
	yatla_preferences_parent_class = g_type_class_peek_parent (klass);
}


static void yatla_preferences_instance_init (YatlaPreferences * self) {
}


GType yatla_preferences_get_type (void) {
	static volatile gsize yatla_preferences_type_id__volatile = 0;
	if (g_once_init_enter (&yatla_preferences_type_id__volatile)) {
		static const GTypeInfo g_define_type_info = { sizeof (YatlaPreferencesClass), (GBaseInitFunc) NULL, (GBaseFinalizeFunc) NULL, (GClassInitFunc) yatla_preferences_class_init, (GClassFinalizeFunc) NULL, NULL, sizeof (YatlaPreferences), 0, (GInstanceInitFunc) yatla_preferences_instance_init, NULL };
		GType yatla_preferences_type_id;
		yatla_preferences_type_id = g_type_register_static (GTK_TYPE_DIALOG, "YatlaPreferences", &g_define_type_info, 0);
		g_once_init_leave (&yatla_preferences_type_id__volatile, yatla_preferences_type_id);
	}
	return yatla_preferences_type_id__volatile;
}




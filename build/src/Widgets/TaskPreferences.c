/* TaskPreferences.c generated by valac 0.24.0, the Vala compiler
 * generated from TaskPreferences.vala, do not modify */


#include <glib.h>
#include <glib-object.h>
#include <gtk/gtk.h>
#include <granite.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <float.h>
#include <math.h>


#define YATLA_TYPE_TASK_PREFERENCES_TYPE (yatla_task_preferences_type_get_type ())

#define YATLA_TYPE_TASK_PREFERENCES (yatla_task_preferences_get_type ())
#define YATLA_TASK_PREFERENCES(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), YATLA_TYPE_TASK_PREFERENCES, YatlaTaskPreferences))
#define YATLA_TASK_PREFERENCES_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), YATLA_TYPE_TASK_PREFERENCES, YatlaTaskPreferencesClass))
#define YATLA_IS_TASK_PREFERENCES(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), YATLA_TYPE_TASK_PREFERENCES))
#define YATLA_IS_TASK_PREFERENCES_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), YATLA_TYPE_TASK_PREFERENCES))
#define YATLA_TASK_PREFERENCES_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), YATLA_TYPE_TASK_PREFERENCES, YatlaTaskPreferencesClass))

typedef struct _YatlaTaskPreferences YatlaTaskPreferences;
typedef struct _YatlaTaskPreferencesClass YatlaTaskPreferencesClass;
typedef struct _YatlaTaskPreferencesPrivate YatlaTaskPreferencesPrivate;

#define YATLA_TYPE_DATABASE (yatla_database_get_type ())
#define YATLA_DATABASE(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), YATLA_TYPE_DATABASE, YatlaDatabase))
#define YATLA_DATABASE_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), YATLA_TYPE_DATABASE, YatlaDatabaseClass))
#define YATLA_IS_DATABASE(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), YATLA_TYPE_DATABASE))
#define YATLA_IS_DATABASE_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), YATLA_TYPE_DATABASE))
#define YATLA_DATABASE_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), YATLA_TYPE_DATABASE, YatlaDatabaseClass))

typedef struct _YatlaDatabase YatlaDatabase;
typedef struct _YatlaDatabaseClass YatlaDatabaseClass;

#define YATLA_TYPE_SIDEBAR (yatla_sidebar_get_type ())
#define YATLA_SIDEBAR(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), YATLA_TYPE_SIDEBAR, YatlaSidebar))
#define YATLA_SIDEBAR_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), YATLA_TYPE_SIDEBAR, YatlaSidebarClass))
#define YATLA_IS_SIDEBAR(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), YATLA_TYPE_SIDEBAR))
#define YATLA_IS_SIDEBAR_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), YATLA_TYPE_SIDEBAR))
#define YATLA_SIDEBAR_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), YATLA_TYPE_SIDEBAR, YatlaSidebarClass))

typedef struct _YatlaSidebar YatlaSidebar;
typedef struct _YatlaSidebarClass YatlaSidebarClass;

#define YATLA_TYPE_LAYOUT (yatla_layout_get_type ())
#define YATLA_LAYOUT(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), YATLA_TYPE_LAYOUT, YatlaLayout))
#define YATLA_LAYOUT_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), YATLA_TYPE_LAYOUT, YatlaLayoutClass))
#define YATLA_IS_LAYOUT(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), YATLA_TYPE_LAYOUT))
#define YATLA_IS_LAYOUT_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), YATLA_TYPE_LAYOUT))
#define YATLA_LAYOUT_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), YATLA_TYPE_LAYOUT, YatlaLayoutClass))

typedef struct _YatlaLayout YatlaLayout;
typedef struct _YatlaLayoutClass YatlaLayoutClass;
#define _g_object_unref0(var) ((var == NULL) ? NULL : (var = (g_object_unref (var), NULL)))
#define _g_free0(var) (var = (g_free (var), NULL))

#define YATLA_TYPE_TASK (yatla_task_get_type ())
#define YATLA_TASK(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), YATLA_TYPE_TASK, YatlaTask))
#define YATLA_TASK_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), YATLA_TYPE_TASK, YatlaTaskClass))
#define YATLA_IS_TASK(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), YATLA_TYPE_TASK))
#define YATLA_IS_TASK_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), YATLA_TYPE_TASK))
#define YATLA_TASK_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), YATLA_TYPE_TASK, YatlaTaskClass))

typedef struct _YatlaTask YatlaTask;
typedef struct _YatlaTaskClass YatlaTaskClass;
typedef struct _Block7Data Block7Data;
typedef struct _Block8Data Block8Data;
#define _g_date_time_unref0(var) ((var == NULL) ? NULL : (var = (g_date_time_unref (var), NULL)))

typedef enum  {
	YATLA_TASK_PREFERENCES_TYPE_CREATE,
	YATLA_TASK_PREFERENCES_TYPE_CHANGE
} YatlaTaskPreferencesType;

struct _YatlaTaskPreferences {
	GtkDialog parent_instance;
	YatlaTaskPreferencesPrivate * priv;
};

struct _YatlaTaskPreferencesClass {
	GtkDialogClass parent_class;
};

struct _YatlaTaskPreferencesPrivate {
	YatlaDatabase* _database;
	YatlaSidebar* _sidebar;
	YatlaLayout* _layout;
	GtkEntry* _name_entry;
	GtkEntry* _note_entry;
	GtkSwitch* _notification_switcher;
	GraniteWidgetsDatePicker* _date_picker;
	GraniteWidgetsTimePicker* _time_picker;
	gchar* _list_name;
	GtkButton* _create_button;
	GtkButton* _change_button;
	YatlaTaskPreferencesType _type;
};

struct _Block7Data {
	int _ref_count_;
	YatlaTaskPreferences* self;
	GtkLabel* date_label;
	GtkLabel* time_label;
};

struct _Block8Data {
	int _ref_count_;
	YatlaTaskPreferences* self;
	YatlaTask* task;
};


static gpointer yatla_task_preferences_parent_class = NULL;

GType yatla_task_preferences_type_get_type (void) G_GNUC_CONST;
GType yatla_task_preferences_get_type (void) G_GNUC_CONST;
GType yatla_database_get_type (void) G_GNUC_CONST;
GType yatla_sidebar_get_type (void) G_GNUC_CONST;
GType yatla_layout_get_type (void) G_GNUC_CONST;
#define YATLA_TASK_PREFERENCES_GET_PRIVATE(o) (G_TYPE_INSTANCE_GET_PRIVATE ((o), YATLA_TYPE_TASK_PREFERENCES, YatlaTaskPreferencesPrivate))
enum  {
	YATLA_TASK_PREFERENCES_DUMMY_PROPERTY
};
GType yatla_task_get_type (void) G_GNUC_CONST;
YatlaTaskPreferences* yatla_task_preferences_new (YatlaTaskPreferencesType type, YatlaLayout* layout, YatlaDatabase* database, YatlaSidebar* sidebar, YatlaTask* task, const gchar* list_name);
YatlaTaskPreferences* yatla_task_preferences_construct (GType object_type, YatlaTaskPreferencesType type, YatlaLayout* layout, YatlaDatabase* database, YatlaSidebar* sidebar, YatlaTask* task, const gchar* list_name);
static void yatla_task_preferences_create_widgets (YatlaTaskPreferences* self, YatlaTask* task);
static void yatla_task_preferences_connect_signals (YatlaTaskPreferences* self, YatlaTask* task);
static Block7Data* block7_data_ref (Block7Data* _data7_);
static void block7_data_unref (void * _userdata_);
static GtkLabel* yatla_task_preferences_create_preferences_label (const gchar* text);
const gchar* yatla_task_get_name (YatlaTask* self);
const gchar* yatla_task_get_note (YatlaTask* self);
GDateTime* yatla_task_get_date (YatlaTask* self);
static void __lambda5_ (Block7Data* _data7_);
static void ___lambda5__g_object_notify (GObject* _sender, GParamSpec* pspec, gpointer self);
static void __lambda6_ (YatlaTaskPreferences* self);
static void ___lambda6__g_object_notify (GObject* _sender, GParamSpec* pspec, gpointer self);
static void __lambda7_ (YatlaTaskPreferences* self);
static void ___lambda7__granite_widgets_time_picker_time_changed (GraniteWidgetsTimePicker* _sender, gpointer self);
static Block8Data* block8_data_ref (Block8Data* _data8_);
static void block8_data_unref (void * _userdata_);
static void __lambda8_ (YatlaTaskPreferences* self);
static void ___lambda8__gtk_editable_changed (GtkEditable* _sender, gpointer self);
static void __lambda9_ (Block8Data* _data8_, gint response_id);
static void yatla_task_preferences_on_create_button_clicked (YatlaTaskPreferences* self);
static void yatla_task_preferences_on_change_button_clicked (YatlaTaskPreferences* self, YatlaTask* task);
static void yatla_task_preferences_on_delete_button_clicked (YatlaTaskPreferences* self, YatlaTask* task);
static void ___lambda9__gtk_dialog_response (GtkDialog* _sender, gint response_id, gpointer self);
YatlaTask* yatla_task_new (const gchar* name, const gchar* note, GDateTime* date, gboolean is_done);
YatlaTask* yatla_task_construct (GType object_type, const gchar* name, const gchar* note, GDateTime* date, gboolean is_done);
gboolean yatla_database_add_task (YatlaDatabase* self, YatlaTask* task, const gchar* list_name);
void yatla_sidebar_add_task (YatlaSidebar* self, YatlaDatabase* database, const gchar* list_name, YatlaTask* task);
void yatla_layout_reset_layout (YatlaLayout* self, YatlaDatabase* database, YatlaSidebar* sidebar);
void yatla_task_set_name (YatlaTask* self, const gchar* value);
void yatla_task_set_note (YatlaTask* self, const gchar* value);
void yatla_task_set_date (YatlaTask* self, GDateTime* value);
gboolean yatla_database_update_task (YatlaDatabase* self, YatlaTask* task, const gchar* list_name);
void yatla_sidebar_update_task (YatlaSidebar* self, const gchar* list_name, YatlaTask* task_to_update);
gboolean yatla_database_remove_task (YatlaDatabase* self, YatlaTask* task, const gchar* list_name);
void yatla_sidebar_remove_task (YatlaSidebar* self, const gchar* list_name, YatlaTask* task_to_remove);
static void yatla_task_preferences_finalize (GObject* obj);


/** for create and change dialogs */
GType yatla_task_preferences_type_get_type (void) {
	static volatile gsize yatla_task_preferences_type_type_id__volatile = 0;
	if (g_once_init_enter (&yatla_task_preferences_type_type_id__volatile)) {
		static const GEnumValue values[] = {{YATLA_TASK_PREFERENCES_TYPE_CREATE, "YATLA_TASK_PREFERENCES_TYPE_CREATE", "create"}, {YATLA_TASK_PREFERENCES_TYPE_CHANGE, "YATLA_TASK_PREFERENCES_TYPE_CHANGE", "change"}, {0, NULL, NULL}};
		GType yatla_task_preferences_type_type_id;
		yatla_task_preferences_type_type_id = g_enum_register_static ("YatlaTaskPreferencesType", values);
		g_once_init_leave (&yatla_task_preferences_type_type_id__volatile, yatla_task_preferences_type_type_id);
	}
	return yatla_task_preferences_type_type_id__volatile;
}


/** index is the index in sidebar.sidebar_list */
static gpointer _g_object_ref0 (gpointer self) {
	return self ? g_object_ref (self) : NULL;
}


YatlaTaskPreferences* yatla_task_preferences_construct (GType object_type, YatlaTaskPreferencesType type, YatlaLayout* layout, YatlaDatabase* database, YatlaSidebar* sidebar, YatlaTask* task, const gchar* list_name) {
	YatlaTaskPreferences * self = NULL;
	YatlaDatabase* _tmp0_ = NULL;
	YatlaDatabase* _tmp1_ = NULL;
	YatlaSidebar* _tmp2_ = NULL;
	YatlaSidebar* _tmp3_ = NULL;
	YatlaLayout* _tmp4_ = NULL;
	YatlaLayout* _tmp5_ = NULL;
	const gchar* _tmp6_ = NULL;
	gchar* _tmp7_ = NULL;
	YatlaTaskPreferencesType _tmp8_ = 0;
	YatlaTask* _tmp9_ = NULL;
	YatlaTask* _tmp10_ = NULL;
	g_return_val_if_fail (layout != NULL, NULL);
	g_return_val_if_fail (database != NULL, NULL);
	g_return_val_if_fail (sidebar != NULL, NULL);
	g_return_val_if_fail (task != NULL, NULL);
	g_return_val_if_fail (list_name != NULL, NULL);
	self = (YatlaTaskPreferences*) g_object_new (object_type, NULL);
	gtk_window_set_title ((GtkWindow*) self, "Create you task");
	gtk_container_set_border_width ((GtkContainer*) self, (guint) 5);
	gtk_window_set_resizable ((GtkWindow*) self, FALSE);
	g_object_set ((GtkWindow*) self, "window-position", GTK_WIN_POS_CENTER, NULL);
	_tmp0_ = database;
	_tmp1_ = _g_object_ref0 (_tmp0_);
	_g_object_unref0 (self->priv->_database);
	self->priv->_database = _tmp1_;
	_tmp2_ = sidebar;
	_tmp3_ = _g_object_ref0 (_tmp2_);
	_g_object_unref0 (self->priv->_sidebar);
	self->priv->_sidebar = _tmp3_;
	_tmp4_ = layout;
	_tmp5_ = _g_object_ref0 (_tmp4_);
	_g_object_unref0 (self->priv->_layout);
	self->priv->_layout = _tmp5_;
	_tmp6_ = list_name;
	_tmp7_ = g_strdup (_tmp6_);
	_g_free0 (self->priv->_list_name);
	self->priv->_list_name = _tmp7_;
	_tmp8_ = type;
	self->priv->_type = _tmp8_;
	_tmp9_ = task;
	yatla_task_preferences_create_widgets (self, _tmp9_);
	_tmp10_ = task;
	yatla_task_preferences_connect_signals (self, _tmp10_);
	gtk_widget_show_all ((GtkWidget*) self);
	return self;
}


YatlaTaskPreferences* yatla_task_preferences_new (YatlaTaskPreferencesType type, YatlaLayout* layout, YatlaDatabase* database, YatlaSidebar* sidebar, YatlaTask* task, const gchar* list_name) {
	return yatla_task_preferences_construct (YATLA_TYPE_TASK_PREFERENCES, type, layout, database, sidebar, task, list_name);
}


static Block7Data* block7_data_ref (Block7Data* _data7_) {
	g_atomic_int_inc (&_data7_->_ref_count_);
	return _data7_;
}


static void block7_data_unref (void * _userdata_) {
	Block7Data* _data7_;
	_data7_ = (Block7Data*) _userdata_;
	if (g_atomic_int_dec_and_test (&_data7_->_ref_count_)) {
		YatlaTaskPreferences* self;
		self = _data7_->self;
		_g_object_unref0 (_data7_->time_label);
		_g_object_unref0 (_data7_->date_label);
		_g_object_unref0 (self);
		g_slice_free (Block7Data, _data7_);
	}
}


static void __lambda5_ (Block7Data* _data7_) {
	YatlaTaskPreferences* self;
	GtkSwitch* _tmp0_ = NULL;
	gboolean _tmp1_ = FALSE;
	gboolean _tmp2_ = FALSE;
	self = _data7_->self;
	_tmp0_ = self->priv->_notification_switcher;
	_tmp1_ = gtk_switch_get_active (_tmp0_);
	_tmp2_ = _tmp1_;
	if (_tmp2_) {
		GtkLabel* _tmp3_ = NULL;
		GraniteWidgetsDatePicker* _tmp4_ = NULL;
		GtkLabel* _tmp5_ = NULL;
		GraniteWidgetsTimePicker* _tmp6_ = NULL;
		_tmp3_ = _data7_->date_label;
		gtk_widget_set_sensitive ((GtkWidget*) _tmp3_, TRUE);
		_tmp4_ = self->priv->_date_picker;
		gtk_widget_set_sensitive ((GtkWidget*) _tmp4_, TRUE);
		_tmp5_ = _data7_->time_label;
		gtk_widget_set_sensitive ((GtkWidget*) _tmp5_, TRUE);
		_tmp6_ = self->priv->_time_picker;
		gtk_widget_set_sensitive ((GtkWidget*) _tmp6_, TRUE);
	} else {
		GtkLabel* _tmp7_ = NULL;
		GraniteWidgetsDatePicker* _tmp8_ = NULL;
		GtkLabel* _tmp9_ = NULL;
		GraniteWidgetsTimePicker* _tmp10_ = NULL;
		_tmp7_ = _data7_->date_label;
		gtk_widget_set_sensitive ((GtkWidget*) _tmp7_, FALSE);
		_tmp8_ = self->priv->_date_picker;
		gtk_widget_set_sensitive ((GtkWidget*) _tmp8_, FALSE);
		_tmp9_ = _data7_->time_label;
		gtk_widget_set_sensitive ((GtkWidget*) _tmp9_, FALSE);
		_tmp10_ = self->priv->_time_picker;
		gtk_widget_set_sensitive ((GtkWidget*) _tmp10_, FALSE);
	}
}


static void ___lambda5__g_object_notify (GObject* _sender, GParamSpec* pspec, gpointer self) {
	__lambda5_ (self);
}


static void __lambda6_ (YatlaTaskPreferences* self) {
	FILE* _tmp0_ = NULL;
	_tmp0_ = stdout;
	fprintf (_tmp0_, "date was changed\n");
}


static void ___lambda6__g_object_notify (GObject* _sender, GParamSpec* pspec, gpointer self) {
	__lambda6_ ((YatlaTaskPreferences*) self);
}


static void __lambda7_ (YatlaTaskPreferences* self) {
	FILE* _tmp0_ = NULL;
	_tmp0_ = stdout;
	fprintf (_tmp0_, "time was changed\n");
}


static void ___lambda7__granite_widgets_time_picker_time_changed (GraniteWidgetsTimePicker* _sender, gpointer self) {
	__lambda7_ ((YatlaTaskPreferences*) self);
}


static void yatla_task_preferences_create_widgets (YatlaTaskPreferences* self, YatlaTask* task) {
	Block7Data* _data7_;
	GtkGrid* content = NULL;
	GtkGrid* _tmp0_ = NULL;
	GtkLabel* name_label = NULL;
	GtkLabel* _tmp1_ = NULL;
	GtkEntry* _tmp2_ = NULL;
	GtkEntry* _tmp3_ = NULL;
	YatlaTask* _tmp4_ = NULL;
	const gchar* _tmp5_ = NULL;
	const gchar* _tmp6_ = NULL;
	GtkLabel* note_label = NULL;
	GtkLabel* _tmp11_ = NULL;
	GtkEntry* _tmp12_ = NULL;
	GtkEntry* _tmp13_ = NULL;
	GtkEntry* _tmp14_ = NULL;
	YatlaTask* _tmp15_ = NULL;
	const gchar* _tmp16_ = NULL;
	const gchar* _tmp17_ = NULL;
	GtkLabel* notification_label = NULL;
	GtkLabel* _tmp18_ = NULL;
	GtkSwitch* _tmp19_ = NULL;
	YatlaTaskPreferencesType _tmp20_ = 0;
	GtkBox* box = NULL;
	GtkBox* _tmp27_ = NULL;
	GtkBox* _tmp28_ = NULL;
	GtkLabel* _tmp29_ = NULL;
	GtkBox* _tmp30_ = NULL;
	GtkSwitch* _tmp31_ = NULL;
	GtkLabel* _tmp32_ = NULL;
	GraniteWidgetsDatePicker* _tmp33_ = NULL;
	GtkLabel* _tmp34_ = NULL;
	GraniteWidgetsTimePicker* _tmp35_ = NULL;
	GtkGrid* _tmp36_ = NULL;
	GtkLabel* _tmp37_ = NULL;
	GtkGrid* _tmp38_ = NULL;
	GtkEntry* _tmp39_ = NULL;
	GtkGrid* _tmp40_ = NULL;
	GtkLabel* _tmp41_ = NULL;
	GtkGrid* _tmp42_ = NULL;
	GtkEntry* _tmp43_ = NULL;
	GtkGrid* _tmp44_ = NULL;
	GtkBox* _tmp45_ = NULL;
	GtkGrid* _tmp46_ = NULL;
	GtkLabel* _tmp47_ = NULL;
	GtkGrid* _tmp48_ = NULL;
	GraniteWidgetsDatePicker* _tmp49_ = NULL;
	GtkGrid* _tmp50_ = NULL;
	GtkLabel* _tmp51_ = NULL;
	GtkGrid* _tmp52_ = NULL;
	GraniteWidgetsTimePicker* _tmp53_ = NULL;
	GtkGrid* _tmp54_ = NULL;
	GtkGrid* _tmp55_ = NULL;
	GtkGrid* _tmp56_ = NULL;
	GtkGrid* _tmp57_ = NULL;
	GtkGrid* _tmp58_ = NULL;
	GtkSwitch* _tmp59_ = NULL;
	GraniteWidgetsDatePicker* _tmp60_ = NULL;
	GraniteWidgetsTimePicker* _tmp61_ = NULL;
	GtkBox* _tmp62_ = NULL;
	GtkGrid* _tmp63_ = NULL;
	YatlaTaskPreferencesType _tmp64_ = 0;
	g_return_if_fail (self != NULL);
	g_return_if_fail (task != NULL);
	_data7_ = g_slice_new0 (Block7Data);
	_data7_->_ref_count_ = 1;
	_data7_->self = g_object_ref (self);
	_tmp0_ = (GtkGrid*) gtk_grid_new ();
	g_object_ref_sink (_tmp0_);
	content = _tmp0_;
	_tmp1_ = yatla_task_preferences_create_preferences_label ("Name:");
	name_label = _tmp1_;
	_tmp2_ = (GtkEntry*) gtk_entry_new ();
	g_object_ref_sink (_tmp2_);
	_g_object_unref0 (self->priv->_name_entry);
	self->priv->_name_entry = _tmp2_;
	_tmp3_ = self->priv->_name_entry;
	gtk_entry_set_placeholder_text (_tmp3_, "Name of the Task");
	_tmp4_ = task;
	_tmp5_ = yatla_task_get_name (_tmp4_);
	_tmp6_ = _tmp5_;
	if (_tmp6_ != NULL) {
		GtkEntry* _tmp7_ = NULL;
		YatlaTask* _tmp8_ = NULL;
		const gchar* _tmp9_ = NULL;
		const gchar* _tmp10_ = NULL;
		_tmp7_ = self->priv->_name_entry;
		_tmp8_ = task;
		_tmp9_ = yatla_task_get_name (_tmp8_);
		_tmp10_ = _tmp9_;
		gtk_entry_set_text (_tmp7_, _tmp10_);
	}
	_tmp11_ = yatla_task_preferences_create_preferences_label ("Note:");
	note_label = _tmp11_;
	_tmp12_ = (GtkEntry*) gtk_entry_new ();
	g_object_ref_sink (_tmp12_);
	_g_object_unref0 (self->priv->_note_entry);
	self->priv->_note_entry = _tmp12_;
	_tmp13_ = self->priv->_note_entry;
	gtk_entry_set_placeholder_text (_tmp13_, "Additional information");
	_tmp14_ = self->priv->_note_entry;
	_tmp15_ = task;
	_tmp16_ = yatla_task_get_note (_tmp15_);
	_tmp17_ = _tmp16_;
	gtk_entry_set_text (_tmp14_, _tmp17_);
	_tmp18_ = yatla_task_preferences_create_preferences_label ("Notification:");
	notification_label = _tmp18_;
	_tmp19_ = (GtkSwitch*) gtk_switch_new ();
	g_object_ref_sink (_tmp19_);
	_g_object_unref0 (self->priv->_notification_switcher);
	self->priv->_notification_switcher = _tmp19_;
	_tmp20_ = self->priv->_type;
	if (_tmp20_ == YATLA_TASK_PREFERENCES_TYPE_CREATE) {
		GtkSwitch* _tmp21_ = NULL;
		_tmp21_ = self->priv->_notification_switcher;
		gtk_switch_set_active (_tmp21_, TRUE);
	} else {
		YatlaTask* _tmp22_ = NULL;
		GDateTime* _tmp23_ = NULL;
		GDateTime* _tmp24_ = NULL;
		_tmp22_ = task;
		_tmp23_ = yatla_task_get_date (_tmp22_);
		_tmp24_ = _tmp23_;
		if (_tmp24_ == NULL) {
			GtkSwitch* _tmp25_ = NULL;
			_tmp25_ = self->priv->_notification_switcher;
			gtk_switch_set_active (_tmp25_, FALSE);
		} else {
			GtkSwitch* _tmp26_ = NULL;
			_tmp26_ = self->priv->_notification_switcher;
			gtk_switch_set_active (_tmp26_, TRUE);
		}
	}
	_tmp27_ = (GtkBox*) gtk_box_new (GTK_ORIENTATION_HORIZONTAL, 20);
	g_object_ref_sink (_tmp27_);
	box = _tmp27_;
	_tmp28_ = box;
	_tmp29_ = notification_label;
	gtk_box_pack_start (_tmp28_, (GtkWidget*) _tmp29_, TRUE, TRUE, (guint) 0);
	_tmp30_ = box;
	_tmp31_ = self->priv->_notification_switcher;
	gtk_box_pack_start (_tmp30_, (GtkWidget*) _tmp31_, TRUE, TRUE, (guint) 0);
	_tmp32_ = yatla_task_preferences_create_preferences_label ("Date:");
	_data7_->date_label = _tmp32_;
	_tmp33_ = granite_widgets_date_picker_new_with_format ("%d/%m/%Y");
	g_object_ref_sink (_tmp33_);
	_g_object_unref0 (self->priv->_date_picker);
	self->priv->_date_picker = _tmp33_;
	_tmp34_ = yatla_task_preferences_create_preferences_label ("Time:");
	_data7_->time_label = _tmp34_;
	_tmp35_ = granite_widgets_time_picker_new ();
	g_object_ref_sink (_tmp35_);
	_g_object_unref0 (self->priv->_time_picker);
	self->priv->_time_picker = _tmp35_;
	_tmp36_ = content;
	_tmp37_ = name_label;
	gtk_grid_attach (_tmp36_, (GtkWidget*) _tmp37_, 0, 2, 1, 1);
	_tmp38_ = content;
	_tmp39_ = self->priv->_name_entry;
	gtk_grid_attach (_tmp38_, (GtkWidget*) _tmp39_, 0, 3, 1, 1);
	_tmp40_ = content;
	_tmp41_ = note_label;
	gtk_grid_attach (_tmp40_, (GtkWidget*) _tmp41_, 1, 2, 1, 1);
	_tmp42_ = content;
	_tmp43_ = self->priv->_note_entry;
	gtk_grid_attach (_tmp42_, (GtkWidget*) _tmp43_, 1, 3, 1, 1);
	_tmp44_ = content;
	_tmp45_ = box;
	gtk_grid_attach (_tmp44_, (GtkWidget*) _tmp45_, 0, 4, 1, 1);
	_tmp46_ = content;
	_tmp47_ = _data7_->date_label;
	gtk_grid_attach (_tmp46_, (GtkWidget*) _tmp47_, 0, 6, 1, 1);
	_tmp48_ = content;
	_tmp49_ = self->priv->_date_picker;
	gtk_grid_attach (_tmp48_, (GtkWidget*) _tmp49_, 0, 8, 1, 1);
	_tmp50_ = content;
	_tmp51_ = _data7_->time_label;
	gtk_grid_attach (_tmp50_, (GtkWidget*) _tmp51_, 1, 6, 1, 1);
	_tmp52_ = content;
	_tmp53_ = self->priv->_time_picker;
	gtk_grid_attach (_tmp52_, (GtkWidget*) _tmp53_, 1, 8, 1, 1);
	_tmp54_ = content;
	gtk_grid_set_column_spacing (_tmp54_, (guint) 20);
	_tmp55_ = content;
	gtk_grid_set_row_spacing (_tmp55_, (guint) 10);
	_tmp56_ = content;
	gtk_widget_set_margin_left ((GtkWidget*) _tmp56_, 10);
	_tmp57_ = content;
	gtk_widget_set_margin_right ((GtkWidget*) _tmp57_, 10);
	_tmp58_ = content;
	gtk_widget_set_margin_bottom ((GtkWidget*) _tmp58_, 5);
	_tmp59_ = self->priv->_notification_switcher;
	g_signal_connect_data ((GObject*) _tmp59_, "notify::active", (GCallback) ___lambda5__g_object_notify, block7_data_ref (_data7_), (GClosureNotify) block7_data_unref, 0);
	_tmp60_ = self->priv->_date_picker;
	g_signal_connect_object ((GObject*) _tmp60_, "notify::date", (GCallback) ___lambda6__g_object_notify, self, 0);
	_tmp61_ = self->priv->_time_picker;
	g_signal_connect_object (_tmp61_, "time-changed", (GCallback) ___lambda7__granite_widgets_time_picker_time_changed, self, 0);
	_tmp62_ = (GtkBox*) gtk_dialog_get_content_area ((GtkDialog*) self);
	_tmp63_ = content;
	gtk_container_add ((GtkContainer*) _tmp62_, (GtkWidget*) _tmp63_);
	gtk_dialog_add_button ((GtkDialog*) self, "_Close", (gint) GTK_RESPONSE_CLOSE);
	_tmp64_ = self->priv->_type;
	if (_tmp64_ == YATLA_TASK_PREFERENCES_TYPE_CREATE) {
		GtkWidget* _tmp65_ = NULL;
		GtkButton* _tmp66_ = NULL;
		GtkButton* _tmp67_ = NULL;
		GtkEntry* _tmp68_ = NULL;
		const gchar* _tmp69_ = NULL;
		const gchar* _tmp70_ = NULL;
		GtkWidget* _tmp71_ = NULL;
		GtkWidget* _tmp72_ = NULL;
		_tmp65_ = gtk_dialog_add_button ((GtkDialog*) self, "_Create", (gint) GTK_RESPONSE_APPLY);
		_tmp66_ = _g_object_ref0 (G_TYPE_CHECK_INSTANCE_TYPE (_tmp65_, GTK_TYPE_BUTTON) ? ((GtkButton*) _tmp65_) : NULL);
		_g_object_unref0 (self->priv->_create_button);
		self->priv->_create_button = _tmp66_;
		_tmp67_ = self->priv->_create_button;
		_tmp68_ = self->priv->_name_entry;
		_tmp69_ = gtk_entry_get_text (_tmp68_);
		_tmp70_ = _tmp69_;
		gtk_widget_set_sensitive ((GtkWidget*) _tmp67_, g_strcmp0 (_tmp70_, "") != 0);
		_tmp71_ = gtk_dialog_get_action_area ((GtkDialog*) self);
		gtk_button_box_set_layout (G_TYPE_CHECK_INSTANCE_TYPE (_tmp71_, GTK_TYPE_BUTTON_BOX) ? ((GtkButtonBox*) _tmp71_) : NULL, GTK_BUTTONBOX_CENTER);
		_tmp72_ = gtk_dialog_get_action_area ((GtkDialog*) self);
		gtk_box_set_spacing ((GtkBox*) (G_TYPE_CHECK_INSTANCE_TYPE (_tmp72_, GTK_TYPE_BUTTON_BOX) ? ((GtkButtonBox*) _tmp72_) : NULL), 170);
	} else {
		GtkWidget* _tmp73_ = NULL;
		GtkButton* _tmp74_ = NULL;
		GtkButton* _tmp75_ = NULL;
		GtkEntry* _tmp76_ = NULL;
		const gchar* _tmp77_ = NULL;
		const gchar* _tmp78_ = NULL;
		GtkWidget* _tmp79_ = NULL;
		gtk_dialog_add_button ((GtkDialog*) self, "_Remove", (gint) GTK_RESPONSE_NO);
		_tmp73_ = gtk_dialog_add_button ((GtkDialog*) self, "_Commit", (gint) GTK_RESPONSE_YES);
		_tmp74_ = _g_object_ref0 (G_TYPE_CHECK_INSTANCE_TYPE (_tmp73_, GTK_TYPE_BUTTON) ? ((GtkButton*) _tmp73_) : NULL);
		_g_object_unref0 (self->priv->_change_button);
		self->priv->_change_button = _tmp74_;
		_tmp75_ = self->priv->_change_button;
		_tmp76_ = self->priv->_name_entry;
		_tmp77_ = gtk_entry_get_text (_tmp76_);
		_tmp78_ = _tmp77_;
		gtk_widget_set_sensitive ((GtkWidget*) _tmp75_, g_strcmp0 (_tmp78_, "") != 0);
		_tmp79_ = gtk_dialog_get_action_area ((GtkDialog*) self);
		gtk_button_box_set_layout (G_TYPE_CHECK_INSTANCE_TYPE (_tmp79_, GTK_TYPE_BUTTON_BOX) ? ((GtkButtonBox*) _tmp79_) : NULL, GTK_BUTTONBOX_EDGE);
	}
	_g_object_unref0 (box);
	_g_object_unref0 (notification_label);
	_g_object_unref0 (note_label);
	_g_object_unref0 (name_label);
	_g_object_unref0 (content);
	block7_data_unref (_data7_);
	_data7_ = NULL;
}


static GtkLabel* yatla_task_preferences_create_preferences_label (const gchar* text) {
	GtkLabel* result = NULL;
	GtkLabel* label = NULL;
	const gchar* _tmp0_ = NULL;
	gchar* _tmp1_ = NULL;
	gchar* _tmp2_ = NULL;
	GtkLabel* _tmp3_ = NULL;
	GtkLabel* _tmp4_ = NULL;
	g_return_val_if_fail (text != NULL, NULL);
	_tmp0_ = text;
	_tmp1_ = g_strdup_printf ("<span weight='bold'>%s</span>", _tmp0_);
	_tmp2_ = _tmp1_;
	_tmp3_ = (GtkLabel*) gtk_label_new (_tmp2_);
	g_object_ref_sink (_tmp3_);
	_tmp4_ = _tmp3_;
	_g_free0 (_tmp2_);
	label = _tmp4_;
	gtk_label_set_use_markup (label, TRUE);
	gtk_misc_set_alignment ((GtkMisc*) label, 0.0f, 0.5f);
	result = label;
	return result;
}


static Block8Data* block8_data_ref (Block8Data* _data8_) {
	g_atomic_int_inc (&_data8_->_ref_count_);
	return _data8_;
}


static void block8_data_unref (void * _userdata_) {
	Block8Data* _data8_;
	_data8_ = (Block8Data*) _userdata_;
	if (g_atomic_int_dec_and_test (&_data8_->_ref_count_)) {
		YatlaTaskPreferences* self;
		self = _data8_->self;
		_g_object_unref0 (_data8_->task);
		_g_object_unref0 (self);
		g_slice_free (Block8Data, _data8_);
	}
}


static void __lambda8_ (YatlaTaskPreferences* self) {
	GtkButton* _tmp0_ = NULL;
	GtkEntry* _tmp1_ = NULL;
	const gchar* _tmp2_ = NULL;
	const gchar* _tmp3_ = NULL;
	_tmp0_ = self->priv->_create_button;
	_tmp1_ = self->priv->_name_entry;
	_tmp2_ = gtk_entry_get_text (_tmp1_);
	_tmp3_ = _tmp2_;
	gtk_widget_set_sensitive ((GtkWidget*) _tmp0_, g_strcmp0 (_tmp3_, "") != 0);
}


static void ___lambda8__gtk_editable_changed (GtkEditable* _sender, gpointer self) {
	__lambda8_ ((YatlaTaskPreferences*) self);
}


static void __lambda9_ (Block8Data* _data8_, gint response_id) {
	YatlaTaskPreferences* self;
	gint _tmp0_ = 0;
	self = _data8_->self;
	_tmp0_ = response_id;
	switch (_tmp0_) {
		case GTK_RESPONSE_APPLY:
		{
			yatla_task_preferences_on_create_button_clicked (self);
			break;
		}
		case GTK_RESPONSE_YES:
		{
			YatlaTask* _tmp1_ = NULL;
			_tmp1_ = _data8_->task;
			yatla_task_preferences_on_change_button_clicked (self, _tmp1_);
			break;
		}
		case GTK_RESPONSE_NO:
		{
			YatlaTask* _tmp2_ = NULL;
			_tmp2_ = _data8_->task;
			yatla_task_preferences_on_delete_button_clicked (self, _tmp2_);
			break;
		}
		case GTK_RESPONSE_CLOSE:
		{
			gtk_widget_destroy ((GtkWidget*) self);
			break;
		}
		default:
		break;
	}
}


static void ___lambda9__gtk_dialog_response (GtkDialog* _sender, gint response_id, gpointer self) {
	__lambda9_ (self, response_id);
}


static void yatla_task_preferences_connect_signals (YatlaTaskPreferences* self, YatlaTask* task) {
	Block8Data* _data8_;
	YatlaTask* _tmp0_ = NULL;
	YatlaTask* _tmp1_ = NULL;
	GtkEntry* _tmp2_ = NULL;
	g_return_if_fail (self != NULL);
	g_return_if_fail (task != NULL);
	_data8_ = g_slice_new0 (Block8Data);
	_data8_->_ref_count_ = 1;
	_data8_->self = g_object_ref (self);
	_tmp0_ = task;
	_tmp1_ = _g_object_ref0 (_tmp0_);
	_g_object_unref0 (_data8_->task);
	_data8_->task = _tmp1_;
	_tmp2_ = self->priv->_name_entry;
	g_signal_connect_object ((GtkEditable*) _tmp2_, "changed", (GCallback) ___lambda8__gtk_editable_changed, self, 0);
	g_signal_connect_data ((GtkDialog*) self, "response", (GCallback) ___lambda9__gtk_dialog_response, block8_data_ref (_data8_), (GClosureNotify) block8_data_unref, 0);
	block8_data_unref (_data8_);
	_data8_ = NULL;
}


static void yatla_task_preferences_on_create_button_clicked (YatlaTaskPreferences* self) {
	YatlaTask* task = NULL;
	GtkSwitch* _tmp0_ = NULL;
	gboolean _tmp1_ = FALSE;
	gboolean _tmp2_ = FALSE;
	YatlaDatabase* _tmp39_ = NULL;
	YatlaTask* _tmp40_ = NULL;
	const gchar* _tmp41_ = NULL;
	YatlaSidebar* _tmp42_ = NULL;
	YatlaDatabase* _tmp43_ = NULL;
	const gchar* _tmp44_ = NULL;
	YatlaTask* _tmp45_ = NULL;
	YatlaLayout* _tmp46_ = NULL;
	YatlaDatabase* _tmp47_ = NULL;
	YatlaSidebar* _tmp48_ = NULL;
	g_return_if_fail (self != NULL);
	_tmp0_ = self->priv->_notification_switcher;
	_tmp1_ = gtk_switch_get_active (_tmp0_);
	_tmp2_ = _tmp1_;
	if (_tmp2_) {
		GDateTime* date = NULL;
		GraniteWidgetsDatePicker* _tmp3_ = NULL;
		GDateTime* _tmp4_ = NULL;
		GDateTime* _tmp5_ = NULL;
		gint _tmp6_ = 0;
		GraniteWidgetsDatePicker* _tmp7_ = NULL;
		GDateTime* _tmp8_ = NULL;
		GDateTime* _tmp9_ = NULL;
		gint _tmp10_ = 0;
		GraniteWidgetsDatePicker* _tmp11_ = NULL;
		GDateTime* _tmp12_ = NULL;
		GDateTime* _tmp13_ = NULL;
		gint _tmp14_ = 0;
		GraniteWidgetsTimePicker* _tmp15_ = NULL;
		GDateTime* _tmp16_ = NULL;
		GDateTime* _tmp17_ = NULL;
		gint _tmp18_ = 0;
		GraniteWidgetsTimePicker* _tmp19_ = NULL;
		GDateTime* _tmp20_ = NULL;
		GDateTime* _tmp21_ = NULL;
		gint _tmp22_ = 0;
		GDateTime* _tmp23_ = NULL;
		GtkEntry* _tmp24_ = NULL;
		const gchar* _tmp25_ = NULL;
		const gchar* _tmp26_ = NULL;
		GtkEntry* _tmp27_ = NULL;
		const gchar* _tmp28_ = NULL;
		const gchar* _tmp29_ = NULL;
		GDateTime* _tmp30_ = NULL;
		YatlaTask* _tmp31_ = NULL;
		_tmp3_ = self->priv->_date_picker;
		_tmp4_ = granite_widgets_date_picker_get_date (_tmp3_);
		_tmp5_ = _tmp4_;
		_tmp6_ = g_date_time_get_year (_tmp5_);
		_tmp7_ = self->priv->_date_picker;
		_tmp8_ = granite_widgets_date_picker_get_date (_tmp7_);
		_tmp9_ = _tmp8_;
		_tmp10_ = g_date_time_get_month (_tmp9_);
		_tmp11_ = self->priv->_date_picker;
		_tmp12_ = granite_widgets_date_picker_get_date (_tmp11_);
		_tmp13_ = _tmp12_;
		_tmp14_ = g_date_time_get_day_of_month (_tmp13_);
		_tmp15_ = self->priv->_time_picker;
		_tmp16_ = granite_widgets_time_picker_get_time (_tmp15_);
		_tmp17_ = _tmp16_;
		_tmp18_ = g_date_time_get_hour (_tmp17_);
		_tmp19_ = self->priv->_time_picker;
		_tmp20_ = granite_widgets_time_picker_get_time (_tmp19_);
		_tmp21_ = _tmp20_;
		_tmp22_ = g_date_time_get_minute (_tmp21_);
		_tmp23_ = g_date_time_new_local (_tmp6_, _tmp10_, _tmp14_, _tmp18_, _tmp22_, (gdouble) 0);
		date = _tmp23_;
		_tmp24_ = self->priv->_name_entry;
		_tmp25_ = gtk_entry_get_text (_tmp24_);
		_tmp26_ = _tmp25_;
		_tmp27_ = self->priv->_note_entry;
		_tmp28_ = gtk_entry_get_text (_tmp27_);
		_tmp29_ = _tmp28_;
		_tmp30_ = date;
		_tmp31_ = yatla_task_new (_tmp26_, _tmp29_, _tmp30_, FALSE);
		_g_object_unref0 (task);
		task = _tmp31_;
		_g_date_time_unref0 (date);
	} else {
		GtkEntry* _tmp32_ = NULL;
		const gchar* _tmp33_ = NULL;
		const gchar* _tmp34_ = NULL;
		GtkEntry* _tmp35_ = NULL;
		const gchar* _tmp36_ = NULL;
		const gchar* _tmp37_ = NULL;
		YatlaTask* _tmp38_ = NULL;
		_tmp32_ = self->priv->_name_entry;
		_tmp33_ = gtk_entry_get_text (_tmp32_);
		_tmp34_ = _tmp33_;
		_tmp35_ = self->priv->_note_entry;
		_tmp36_ = gtk_entry_get_text (_tmp35_);
		_tmp37_ = _tmp36_;
		_tmp38_ = yatla_task_new (_tmp34_, _tmp37_, NULL, FALSE);
		_g_object_unref0 (task);
		task = _tmp38_;
	}
	_tmp39_ = self->priv->_database;
	_tmp40_ = task;
	_tmp41_ = self->priv->_list_name;
	yatla_database_add_task (_tmp39_, _tmp40_, _tmp41_);
	_tmp42_ = self->priv->_sidebar;
	_tmp43_ = self->priv->_database;
	_tmp44_ = self->priv->_list_name;
	_tmp45_ = task;
	yatla_sidebar_add_task (_tmp42_, _tmp43_, _tmp44_, _tmp45_);
	_tmp46_ = self->priv->_layout;
	_tmp47_ = self->priv->_database;
	_tmp48_ = self->priv->_sidebar;
	yatla_layout_reset_layout (_tmp46_, _tmp47_, _tmp48_);
	gtk_widget_destroy ((GtkWidget*) self);
	_g_object_unref0 (task);
}


static void yatla_task_preferences_on_change_button_clicked (YatlaTaskPreferences* self, YatlaTask* task) {
	YatlaTask* _tmp0_ = NULL;
	GtkEntry* _tmp1_ = NULL;
	const gchar* _tmp2_ = NULL;
	const gchar* _tmp3_ = NULL;
	YatlaTask* _tmp4_ = NULL;
	GtkEntry* _tmp5_ = NULL;
	const gchar* _tmp6_ = NULL;
	const gchar* _tmp7_ = NULL;
	GtkSwitch* _tmp8_ = NULL;
	gboolean _tmp9_ = FALSE;
	gboolean _tmp10_ = FALSE;
	YatlaDatabase* _tmp35_ = NULL;
	YatlaTask* _tmp36_ = NULL;
	const gchar* _tmp37_ = NULL;
	YatlaSidebar* _tmp38_ = NULL;
	const gchar* _tmp39_ = NULL;
	YatlaTask* _tmp40_ = NULL;
	YatlaLayout* _tmp41_ = NULL;
	YatlaDatabase* _tmp42_ = NULL;
	YatlaSidebar* _tmp43_ = NULL;
	g_return_if_fail (self != NULL);
	g_return_if_fail (task != NULL);
	_tmp0_ = task;
	_tmp1_ = self->priv->_name_entry;
	_tmp2_ = gtk_entry_get_text (_tmp1_);
	_tmp3_ = _tmp2_;
	yatla_task_set_name (_tmp0_, _tmp3_);
	_tmp4_ = task;
	_tmp5_ = self->priv->_note_entry;
	_tmp6_ = gtk_entry_get_text (_tmp5_);
	_tmp7_ = _tmp6_;
	yatla_task_set_note (_tmp4_, _tmp7_);
	_tmp8_ = self->priv->_notification_switcher;
	_tmp9_ = gtk_switch_get_active (_tmp8_);
	_tmp10_ = _tmp9_;
	if (_tmp10_) {
		GDateTime* date = NULL;
		GraniteWidgetsDatePicker* _tmp11_ = NULL;
		GDateTime* _tmp12_ = NULL;
		GDateTime* _tmp13_ = NULL;
		gint _tmp14_ = 0;
		GraniteWidgetsDatePicker* _tmp15_ = NULL;
		GDateTime* _tmp16_ = NULL;
		GDateTime* _tmp17_ = NULL;
		gint _tmp18_ = 0;
		GraniteWidgetsDatePicker* _tmp19_ = NULL;
		GDateTime* _tmp20_ = NULL;
		GDateTime* _tmp21_ = NULL;
		gint _tmp22_ = 0;
		GraniteWidgetsTimePicker* _tmp23_ = NULL;
		GDateTime* _tmp24_ = NULL;
		GDateTime* _tmp25_ = NULL;
		gint _tmp26_ = 0;
		GraniteWidgetsTimePicker* _tmp27_ = NULL;
		GDateTime* _tmp28_ = NULL;
		GDateTime* _tmp29_ = NULL;
		gint _tmp30_ = 0;
		GDateTime* _tmp31_ = NULL;
		YatlaTask* _tmp32_ = NULL;
		GDateTime* _tmp33_ = NULL;
		_tmp11_ = self->priv->_date_picker;
		_tmp12_ = granite_widgets_date_picker_get_date (_tmp11_);
		_tmp13_ = _tmp12_;
		_tmp14_ = g_date_time_get_year (_tmp13_);
		_tmp15_ = self->priv->_date_picker;
		_tmp16_ = granite_widgets_date_picker_get_date (_tmp15_);
		_tmp17_ = _tmp16_;
		_tmp18_ = g_date_time_get_month (_tmp17_);
		_tmp19_ = self->priv->_date_picker;
		_tmp20_ = granite_widgets_date_picker_get_date (_tmp19_);
		_tmp21_ = _tmp20_;
		_tmp22_ = g_date_time_get_day_of_month (_tmp21_);
		_tmp23_ = self->priv->_time_picker;
		_tmp24_ = granite_widgets_time_picker_get_time (_tmp23_);
		_tmp25_ = _tmp24_;
		_tmp26_ = g_date_time_get_hour (_tmp25_);
		_tmp27_ = self->priv->_time_picker;
		_tmp28_ = granite_widgets_time_picker_get_time (_tmp27_);
		_tmp29_ = _tmp28_;
		_tmp30_ = g_date_time_get_minute (_tmp29_);
		_tmp31_ = g_date_time_new_local (_tmp14_, _tmp18_, _tmp22_, _tmp26_, _tmp30_, (gdouble) 0);
		date = _tmp31_;
		_tmp32_ = task;
		_tmp33_ = date;
		yatla_task_set_date (_tmp32_, _tmp33_);
		_g_date_time_unref0 (date);
	} else {
		YatlaTask* _tmp34_ = NULL;
		_tmp34_ = task;
		yatla_task_set_date (_tmp34_, NULL);
	}
	_tmp35_ = self->priv->_database;
	_tmp36_ = task;
	_tmp37_ = self->priv->_list_name;
	yatla_database_update_task (_tmp35_, _tmp36_, _tmp37_);
	_tmp38_ = self->priv->_sidebar;
	_tmp39_ = self->priv->_list_name;
	_tmp40_ = task;
	yatla_sidebar_update_task (_tmp38_, _tmp39_, _tmp40_);
	_tmp41_ = self->priv->_layout;
	_tmp42_ = self->priv->_database;
	_tmp43_ = self->priv->_sidebar;
	yatla_layout_reset_layout (_tmp41_, _tmp42_, _tmp43_);
	gtk_widget_destroy ((GtkWidget*) self);
}


static void yatla_task_preferences_on_delete_button_clicked (YatlaTaskPreferences* self, YatlaTask* task) {
	YatlaDatabase* _tmp0_ = NULL;
	YatlaTask* _tmp1_ = NULL;
	const gchar* _tmp2_ = NULL;
	YatlaSidebar* _tmp3_ = NULL;
	const gchar* _tmp4_ = NULL;
	YatlaTask* _tmp5_ = NULL;
	YatlaLayout* _tmp6_ = NULL;
	YatlaDatabase* _tmp7_ = NULL;
	YatlaSidebar* _tmp8_ = NULL;
	g_return_if_fail (self != NULL);
	g_return_if_fail (task != NULL);
	_tmp0_ = self->priv->_database;
	_tmp1_ = task;
	_tmp2_ = self->priv->_list_name;
	yatla_database_remove_task (_tmp0_, _tmp1_, _tmp2_);
	_tmp3_ = self->priv->_sidebar;
	_tmp4_ = self->priv->_list_name;
	_tmp5_ = task;
	yatla_sidebar_remove_task (_tmp3_, _tmp4_, _tmp5_);
	_tmp6_ = self->priv->_layout;
	_tmp7_ = self->priv->_database;
	_tmp8_ = self->priv->_sidebar;
	yatla_layout_reset_layout (_tmp6_, _tmp7_, _tmp8_);
	gtk_widget_destroy ((GtkWidget*) self);
}


static void yatla_task_preferences_class_init (YatlaTaskPreferencesClass * klass) {
	yatla_task_preferences_parent_class = g_type_class_peek_parent (klass);
	g_type_class_add_private (klass, sizeof (YatlaTaskPreferencesPrivate));
	G_OBJECT_CLASS (klass)->finalize = yatla_task_preferences_finalize;
}


static void yatla_task_preferences_instance_init (YatlaTaskPreferences * self) {
	self->priv = YATLA_TASK_PREFERENCES_GET_PRIVATE (self);
}


static void yatla_task_preferences_finalize (GObject* obj) {
	YatlaTaskPreferences * self;
	self = G_TYPE_CHECK_INSTANCE_CAST (obj, YATLA_TYPE_TASK_PREFERENCES, YatlaTaskPreferences);
	_g_object_unref0 (self->priv->_database);
	_g_object_unref0 (self->priv->_sidebar);
	_g_object_unref0 (self->priv->_layout);
	_g_object_unref0 (self->priv->_name_entry);
	_g_object_unref0 (self->priv->_note_entry);
	_g_object_unref0 (self->priv->_notification_switcher);
	_g_object_unref0 (self->priv->_date_picker);
	_g_object_unref0 (self->priv->_time_picker);
	_g_free0 (self->priv->_list_name);
	_g_object_unref0 (self->priv->_create_button);
	_g_object_unref0 (self->priv->_change_button);
	G_OBJECT_CLASS (yatla_task_preferences_parent_class)->finalize (obj);
}


GType yatla_task_preferences_get_type (void) {
	static volatile gsize yatla_task_preferences_type_id__volatile = 0;
	if (g_once_init_enter (&yatla_task_preferences_type_id__volatile)) {
		static const GTypeInfo g_define_type_info = { sizeof (YatlaTaskPreferencesClass), (GBaseInitFunc) NULL, (GBaseFinalizeFunc) NULL, (GClassInitFunc) yatla_task_preferences_class_init, (GClassFinalizeFunc) NULL, NULL, sizeof (YatlaTaskPreferences), 0, (GInstanceInitFunc) yatla_task_preferences_instance_init, NULL };
		GType yatla_task_preferences_type_id;
		yatla_task_preferences_type_id = g_type_register_static (GTK_TYPE_DIALOG, "YatlaTaskPreferences", &g_define_type_info, 0);
		g_once_init_leave (&yatla_task_preferences_type_id__volatile, yatla_task_preferences_type_id);
	}
	return yatla_task_preferences_type_id__volatile;
}




#Aeon Form Popup Addon

##Overview

The Aeon Form Popup addon is a client addon that will display a popup box with a configurable message each time a request, user, or activity form is opened that contains a value in the field specified in the addon settings. If the open record does not contain a value in that field, no popup will display. The field selected to trigger the popup box must be either a default Aeon field in the configured form's underlying database table (Transactions, Users, or Activities) or a custom field of the corresponding type defined in the Aeon Customization Manager's CustomFieldDefinitions table.

The addon registers against `FormRequest`, `FormUserInfo`, and `FormActivity`. A single addon instance only acts on the form selected by the FormType setting, so up to three instances may be installed alongside each other — one per form type. Installing more than one instance for the same FormType is not supported; both instances will fire on that form.

##Settings

###FormType
This setting controls which form the addon acts on and which database table the PopupField is read from. Accepted values are `Request` (acts on the request form, reads from the Transactions table), `User` (acts on the user info form, reads from the Users table), or `Activity` (acts on the activity form, reads from the Activities table). An instance whose FormType does not match the form that opened will silently do nothing on that form.

###PopupField
This setting should be configured to contain the name of the Aeon field that will trigger the popup to display if it contains a value. The field selected must be a field in the table corresponding to the FormType setting, or a custom field of the corresponding type. If a custom field is selected, then this setting should contain the short name for the field as defined in the Customization Manager's CustomFieldDefinitions table.

###CustomField
Must be checked if the field configured in the PopupField setting is a custom field. Custom fields are fields defined in the Customization Manager's CustomFieldDefinitions table.

###Message
This setting should be configured to contain the message that you want to display in the popup box.

##Example Use Case and Configuration

An example use case for this addon is to configure it to display a warning message when a request for a restricted item that requires special handling is opened in the Aeon Client. Configuration steps for this use case are as follows:

1. Set the FormType setting to `Request`.
2. Decide which Aeon field will be used to indicate that a request is for a restricted item. You can either use a default Aeon field in the Transactions table such as ItemInfo1 or use a Transaction-type custom field configured in the Aeon Customization Manager. If a default field is used, then enter the name of that field into the PopupField setting (e.g., ItemInfo1). If a custom field is used, enter the short name for that field as defined in the Customization Manager's CustomFieldDefinitions table.
3. Check the addon's CustomField setting if the field selected for the PopupField setting is a custom field. Leave this setting unchecked if the PopupField is a default Aeon field such as ItemInfo1.
4. Change the Message setting to contain the text for the message you would like the popup to display when a request containing a value in the PopupField is opened (e.g., "This request is for a restricted item. Please check notes for handling instructions.").
5. Click Save Settings to save the configuration settings for the addon.
6. Each time a request is opened that contains a value in the PopupField, a popup box will appear displaying the message you configured in step four.

The same pattern applies for the User and Activity form types — set FormType to `User` or `Activity`, then select a PopupField from the Users or Activities table (or a custom field of that type) and configure the Message accordingly.

###Addon Configuration Error Handling

If the PopupField and/or CustomField settings are configured incorrectly (e.g., if the name of the PopupField is misspelled, the CustomField setting is not checked for a custom field, the PopupField names a field that does not exist on the table matching FormType, etc.), then an error message stating "Popup field not found. Check addon configuration" will display each time the configured form is opened in the Aeon Client. To resolve this error, check the addon settings and adjust your configuration appropriately.

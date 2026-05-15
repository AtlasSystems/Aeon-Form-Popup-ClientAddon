#Aeon Request Form Popup Addon

##Overview

The Aeon Request Form Popup addon is a client addon that will display a popup box with a configurable message each time the request form is opened for a request containing a value in the field specified in the addon settings. If a request does not contain a value in that field, no popup will display when the request form is opened. The field selected to trigger the popup box must be either a default Aeon field in the Transactions database table or a Transaction-type custom field defined in the Aeon Customization Manager's CustomFieldDefinitions table.

##Settings

###PopupField
This setting should be configued to contain the name of the Aeon field that will trigger the popup to display if it contains a value. The field selected must be a field in the Transactions table or a Transaction-type custom field. If a custom field is selected, then this setting should contain the short name for the field as defined in the Customization Manager's CustomFieldDefinitions table.

###CustomField
Must be checked if the field configured in the PopupField setting is a custom field. Custom fields are fields defined in the Customization Manager's CustomFieldDefinitions table.

###Message
This setting should be configured to contain the message that you want to display in the popup box. 

##Example Use Case and Configuration

An example use case for this addon is to configure it to display a warning message when a request for a restricted item that requires special handling is opened in the Aeon Client. Configuration steps for this use case are as follows:

1. Decide which Aeon field will be used to indicate that a request is for a restricted item. You can either use a default Aeon field in the Transactions table such as ItemInfo1 or use a Transaction-type custom field configured in the Aeon Customization Manager. If a default field is used, then enter the name of that field into the PopupField setting (e.g., ItemInfo1). If a custom field is used, enter the short name for that field as defined in the Customization Manager's CustomFieldDefinitions table. 
2. Check the addon's CustomField setting if the field selected for the PopupField setting is a custom field. Leave this setting unchecked if the PopupField is a default Aeon field such as ItemInfo1.
3. Change the Message setting to contain the text for the message you would like the popup to display when a request containing a value in the PopupField is opened (e.g., "This request is for a restricted item. Please check notes for handling instructions.").
4. Click Save Settings to save the configuration settings for the addon.
5. Each time a request is opened that contains a value in the PopupField, a popup box will appear displaying the message you configured in step three.

###Addon Configuration Error Handling

If either the PopupField and/or CustomField settings are configured incorrectly (e.g., if the name of the PopupField is misspelled, the CustomField setting is not checked for a custom field, etc.), then an error message stating "Popup field not found. Check addon configuration" will display each time a request form is opened in the Aeon Client. This error message will also display if the PopupField setting contains a field that is not in the Transactions table or is not a Transaction-type custom field. To resolve this error, check the addon settings and adjust your configuration appropriately. 



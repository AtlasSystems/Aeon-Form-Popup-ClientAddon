--Form Popup Addon

--Import settings
local settings = {};
settings.FormType = GetSetting("FormType");
if settings.FormType:lower() == "request" then
    settings.FormType = "Transaction";
end
settings.PopupField = GetSetting("PopupField");
settings.CustomField = GetSetting("CustomField")
settings.Message = GetSetting("Message");

--Create variable for InterfaceManager object
local interfaceMngr = nil;

function Init()
    -- Only run if on the configured FormType.
    if not IsCorrectForm() then
        return;
    end
    --Create InterfaceManager object
    interfaceMngr = GetInterfaceManager();

    --Retrieve and check the value of the popup field defined in addon settings
    local popupFieldValue = nil;

    --If the popup field is successfully found in the database, set the value of that field in the popupFieldValue variable
    local succeeded, err = pcall(function ()

			if settings.CustomField == true then
				popupFieldValue = GetFieldValue(settings.FormType .. "." .. "CustomFields", settings.PopupField);

			else
				popupFieldValue = GetFieldValue(settings.FormType, settings.PopupField);

			end

		end);
    
    --If the popup field is not found in the database, display an error message prompting user to check the addon configuration settings    
    if not succeeded then
        LogDebug("Popup field not found. Check addon configuration.")
        OnError(err);
        interfaceMngr:ShowMessage("Popup field not found. Check addon configuration.", "Request Form Popup Addon Error");
    end

    --If the popup field contains a value, show the message defined in the addon settings
    if popupFieldValue ~= nil and popupFieldValue ~= "" and popupFieldValue ~= false then
        interfaceMngr:ShowMessage(settings.Message, "Attention!");
    end

end

function IsCorrectForm()
    if (settings.FormType == "Transaction" and GetFieldValue("Transaction", "TransactionNumber"))
    or (settings.FormType == "User" and GetFieldValue("User", "Username") and not GetFieldValue("Transaction", "TransactionNumber"))
    or (settings.FormType == "Activity" and GetFieldValue("Activity", "ID") and not GetFieldValue("Transaction", "TransactionNumber")) then
        return true;
    end

    return false;
end

--Catch and log errors encountered by the addon
function OnError(e)
    if e == nil then
        LogDebug("OnError supplied a nil error");
        return;
    end

    LogDebug("An error occurred using the Request Form Popup addon");
end
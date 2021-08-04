/// copy_save(from, to)
file1 = working_directory + "\multitroid\save" + string(argument0 + 1);
file2 = working_directory + "\multitroid\save" + string(argument1 + 1);
if (file_exists(file2)) file_delete(file2);
file_copy(file1, file2);
with (oGameSelMenu) event_user(2);
saveslot_flash(argument1);

if (file_exists(working_directory + "\multitroid\random" + string(argument1 + 1) + ".ini"))
{
    //This is only here for old file cleanup.
    file_delete(working_directory + "\multitroid\random" + string(argument1 + 1) + ".ini");
}
if (file_exists(working_directory + "\multitroid\save" + string(argument1 + 1) + ".dat"))
{
    file_delete(working_directory + "\multitroid\save" + string(argument1 + 1) + ".dat");
} 
if (file_exists(working_directory + "\multitroid\save" + string(argument0 + 1) + ".dat")) 
{ 
    file_copy(working_directory + "\multitroid\save" + string(argument0 + 1) + ".dat", working_directory + "\multitroid\save" + string(argument1 + 1) + ".dat");
}


# Example: Copying a configuration file to the project directory
set project_dir [get_property DIRECTORY [current_project]]
file copy -force program.hex $project_dir/SoC.srcs/sources_1/new/program.hex
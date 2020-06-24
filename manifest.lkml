project_name: "david_c_ecom"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }

constant: my_name {
  value: "David's"
}

constant: user_test {
  value: "users"
  export: override_optional
}

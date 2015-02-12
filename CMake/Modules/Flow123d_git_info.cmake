# ####
# # Detect Git executable and retrieve some information from the repository.
# # 
# # Use variable: FLOW123D_SOURCE_DIR as working directory when calling git 
# #
# # Module set (not cached) these variables:
# # GIT_BRANCH - current git branch
# # GIT_DESCRIBE - human-friendly description of current commit
# #                (last tag + hash)
# # GIT_URL - URL of remote repository 
# #
# # Consistent version info to be used on various places:
# # For CPack versioning: 
# # GIT_VERSION_MAJOR, GIT_VERSION_MINOR, GIT_VERSION_PATCH
# # Version in flow123d executable, ref manual and in final package names
# # GIT_VERSION_FULL
# # 

# include(FindGit)

# if (GIT_FOUND)     
#   set(GIT_BRANCH "Master" CACHE INTERNAL "Current git branch.")
#   set(GIT_DESCRIBE "Last commit" CACHE INTERNAL "Human readable description of last git commit.")
#   set(GIT_URL "https://github.com/x3mSpeedy/Hello-World.git" CACHE INTERNAL "URL of remote repository.")
#   set(GIT_VERSION_FULL "${GIT_VERSION_MAJOR}.${GIT_VERSION_MINOR}.${GIT_VERSION_PATCH}" CACHE INTERNAL "Full version name.")
# endif()

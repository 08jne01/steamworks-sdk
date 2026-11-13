add_library(steamworks-sdk INTERFACE)

include("setup.cmake")
target_include_directories(steamworks-sdk INTERFACE "public")

set(STEAM_CRYPT_PATH "public/steam/lib/${STEAMWORKS_PLATFORM}")
set(STEAM_API_PATH "redistributable_bin/${STEAMWORKS_PLATFORM}")

target_link_directories(steamworks-sdk INTERFACE 
    ${STEAM_CRYPT_PATH}
    ${STEAM_API_PATH}
)

target_link_libraries(steamworks-sdk INTERFACE
    steam_api64
    sdkencryptedappticket64
)
set(STEAMWORKS_PLATFORM "win64")
set(STEAMWORKS_PLATFORM_SHARED_EXT ".dll")
set(STEAM_CRYPT_PATH "public/steam/lib/${STEAMWORKS_PLATFORM}")
set(STEAM_API_PATH "redistributable_bin/${STEAMWORKS_PLATFORM}")

function(copy_steamworks_sdk_libs TARGET_NAME STEAMWORKS_PATH BIN_PATH)
    add_custom_command(TARGET ${TARGET_NAME} POST_BUILD
        COMMAND "${CMAKE_COMMAND}" 
        -E copy_if_different 
        "${STEAMWORKS_PATH}/${STEAM_API_PATH}/steam_api64.dll" 
        "${BIN_PATH}/steam_api64.dll"
    )

    add_custom_command(TARGET ${TARGET_NAME} POST_BUILD
        COMMAND "${CMAKE_COMMAND}" 
        -E copy_if_different
        "${STEAMWORKS_PATH}/${STEAM_CRYPT_PATH}/sdkencryptedappticket64.dll" 
        "${BIN_PATH}/sdkencryptedappticket64.dll"
    )
endfunction()
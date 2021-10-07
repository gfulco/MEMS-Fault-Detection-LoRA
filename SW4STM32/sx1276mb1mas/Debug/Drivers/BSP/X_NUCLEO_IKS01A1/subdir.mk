################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/X_NUCLEO_IKS01A1/x_nucleo_iks01a1.c \
../Drivers/BSP/X_NUCLEO_IKS01A1/x_nucleo_iks01a1_accelero.c \
C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/X_NUCLEO_IKS01A1/x_nucleo_iks01a1_humidity.c \
C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/X_NUCLEO_IKS01A1/x_nucleo_iks01a1_pressure.c \
C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/X_NUCLEO_IKS01A1/x_nucleo_iks01a1_temperature.c 

OBJS += \
./Drivers/BSP/X_NUCLEO_IKS01A1/x_nucleo_iks01a1.o \
./Drivers/BSP/X_NUCLEO_IKS01A1/x_nucleo_iks01a1_accelero.o \
./Drivers/BSP/X_NUCLEO_IKS01A1/x_nucleo_iks01a1_humidity.o \
./Drivers/BSP/X_NUCLEO_IKS01A1/x_nucleo_iks01a1_pressure.o \
./Drivers/BSP/X_NUCLEO_IKS01A1/x_nucleo_iks01a1_temperature.o 

C_DEPS += \
./Drivers/BSP/X_NUCLEO_IKS01A1/x_nucleo_iks01a1.d \
./Drivers/BSP/X_NUCLEO_IKS01A1/x_nucleo_iks01a1_accelero.d \
./Drivers/BSP/X_NUCLEO_IKS01A1/x_nucleo_iks01a1_humidity.d \
./Drivers/BSP/X_NUCLEO_IKS01A1/x_nucleo_iks01a1_pressure.d \
./Drivers/BSP/X_NUCLEO_IKS01A1/x_nucleo_iks01a1_temperature.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/X_NUCLEO_IKS01A1/x_nucleo_iks01a1.o: C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/X_NUCLEO_IKS01A1/x_nucleo_iks01a1.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -DUSE_HAL_DRIVER -DREGION_EU868 -DX_NUCLEO_IKS01A1 -DARM_MATH_CM4 '-D__FPU_PRESENT=1' -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Projects/STM32L476RG-Nucleo/Applications/LoRa/End_Node/Core/inc" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Projects/STM32L476RG-Nucleo/Applications/LoRa/End_Node/LoRaWAN/App/inc" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/STM32L4xx_Nucleo" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/CMSIS/Include" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Middlewares/Third_Party/LoRaWAN/Crypto" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Middlewares/Third_Party/LoRaWAN/Mac" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Middlewares/Third_Party/LoRaWAN/Phy" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Middlewares/Third_Party/LoRaWAN/Utilities" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/X_NUCLEO_IKS01A1" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/X_NUCLEO_IKS01A2" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/Components/Common" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/Components/hts221" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/Components/lps22hb" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/Components/lps25hb" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/Components/sx1276" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Middlewares/Third_Party/LoRaWAN/Core" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/sx1276mb1mas" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/FFT" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/Components/lsm6ds0" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/Components/lsm6ds3" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/CMSIS/DSP/Source"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/BSP/X_NUCLEO_IKS01A1/%.o: ../Drivers/BSP/X_NUCLEO_IKS01A1/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -DUSE_HAL_DRIVER -DREGION_EU868 -DX_NUCLEO_IKS01A1 -DARM_MATH_CM4 '-D__FPU_PRESENT=1' -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Projects/STM32L476RG-Nucleo/Applications/LoRa/End_Node/Core/inc" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Projects/STM32L476RG-Nucleo/Applications/LoRa/End_Node/LoRaWAN/App/inc" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/STM32L4xx_Nucleo" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/CMSIS/Include" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Middlewares/Third_Party/LoRaWAN/Crypto" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Middlewares/Third_Party/LoRaWAN/Mac" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Middlewares/Third_Party/LoRaWAN/Phy" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Middlewares/Third_Party/LoRaWAN/Utilities" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/X_NUCLEO_IKS01A1" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/X_NUCLEO_IKS01A2" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/Components/Common" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/Components/hts221" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/Components/lps22hb" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/Components/lps25hb" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/Components/sx1276" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Middlewares/Third_Party/LoRaWAN/Core" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/sx1276mb1mas" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/FFT" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/Components/lsm6ds0" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/Components/lsm6ds3" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/CMSIS/DSP/Source"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/BSP/X_NUCLEO_IKS01A1/x_nucleo_iks01a1_humidity.o: C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/X_NUCLEO_IKS01A1/x_nucleo_iks01a1_humidity.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -DUSE_HAL_DRIVER -DREGION_EU868 -DX_NUCLEO_IKS01A1 -DARM_MATH_CM4 '-D__FPU_PRESENT=1' -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Projects/STM32L476RG-Nucleo/Applications/LoRa/End_Node/Core/inc" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Projects/STM32L476RG-Nucleo/Applications/LoRa/End_Node/LoRaWAN/App/inc" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/STM32L4xx_Nucleo" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/CMSIS/Include" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Middlewares/Third_Party/LoRaWAN/Crypto" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Middlewares/Third_Party/LoRaWAN/Mac" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Middlewares/Third_Party/LoRaWAN/Phy" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Middlewares/Third_Party/LoRaWAN/Utilities" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/X_NUCLEO_IKS01A1" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/X_NUCLEO_IKS01A2" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/Components/Common" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/Components/hts221" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/Components/lps22hb" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/Components/lps25hb" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/Components/sx1276" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Middlewares/Third_Party/LoRaWAN/Core" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/sx1276mb1mas" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/FFT" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/Components/lsm6ds0" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/Components/lsm6ds3" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/CMSIS/DSP/Source"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/BSP/X_NUCLEO_IKS01A1/x_nucleo_iks01a1_pressure.o: C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/X_NUCLEO_IKS01A1/x_nucleo_iks01a1_pressure.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -DUSE_HAL_DRIVER -DREGION_EU868 -DX_NUCLEO_IKS01A1 -DARM_MATH_CM4 '-D__FPU_PRESENT=1' -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Projects/STM32L476RG-Nucleo/Applications/LoRa/End_Node/Core/inc" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Projects/STM32L476RG-Nucleo/Applications/LoRa/End_Node/LoRaWAN/App/inc" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/STM32L4xx_Nucleo" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/CMSIS/Include" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Middlewares/Third_Party/LoRaWAN/Crypto" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Middlewares/Third_Party/LoRaWAN/Mac" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Middlewares/Third_Party/LoRaWAN/Phy" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Middlewares/Third_Party/LoRaWAN/Utilities" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/X_NUCLEO_IKS01A1" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/X_NUCLEO_IKS01A2" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/Components/Common" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/Components/hts221" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/Components/lps22hb" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/Components/lps25hb" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/Components/sx1276" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Middlewares/Third_Party/LoRaWAN/Core" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/sx1276mb1mas" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/FFT" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/Components/lsm6ds0" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/Components/lsm6ds3" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/CMSIS/DSP/Source"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/BSP/X_NUCLEO_IKS01A1/x_nucleo_iks01a1_temperature.o: C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/X_NUCLEO_IKS01A1/x_nucleo_iks01a1_temperature.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -DUSE_HAL_DRIVER -DREGION_EU868 -DX_NUCLEO_IKS01A1 -DARM_MATH_CM4 '-D__FPU_PRESENT=1' -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Projects/STM32L476RG-Nucleo/Applications/LoRa/End_Node/Core/inc" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Projects/STM32L476RG-Nucleo/Applications/LoRa/End_Node/LoRaWAN/App/inc" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/STM32L4xx_Nucleo" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/CMSIS/Include" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Middlewares/Third_Party/LoRaWAN/Crypto" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Middlewares/Third_Party/LoRaWAN/Mac" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Middlewares/Third_Party/LoRaWAN/Phy" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Middlewares/Third_Party/LoRaWAN/Utilities" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/X_NUCLEO_IKS01A1" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/X_NUCLEO_IKS01A2" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/Components/Common" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/Components/hts221" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/Components/lps22hb" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/Components/lps25hb" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/Components/sx1276" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Middlewares/Third_Party/LoRaWAN/Core" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/sx1276mb1mas" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/FFT" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/Components/lsm6ds0" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/BSP/Components/lsm6ds3" -I"C:/Users/Giammario/Desktop/STM32CubeExpansion_LRWAN_V1.2.2/Drivers/CMSIS/DSP/Source"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


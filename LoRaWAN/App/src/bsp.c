/**
  ******************************************************************************
  * @file    bsp.c
  * @author  MCD Application Team
  * @brief   manages the sensors on the application
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2018 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under Ultimate Liberty license
  * SLA0044, the "License"; You may not use this file except in compliance with
  * the License. You may obtain a copy of the License at:
  *                             www.st.com/SLA0044
  *
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include <string.h>
#include <stdlib.h>
#include "hw.h"
#include "timeServer.h"
#include "bsp.h"
#include "fft.h"
#include "lora.h"
#if defined(LRWAN_NS1)
#include "lrwan_ns1_humidity.h"
#include "lrwan_ns1_pressure.h"
#include "lrwan_ns1_temperature.h"
#else  /* not LRWAN_NS1 */
#if defined(SENSOR_ENABLED)
#if defined (X_NUCLEO_IKS01A1)
//#warning "Do not forget to select X_NUCLEO_IKS01A1 files group instead of X_NUCLEO_IKS01A2"
//#include "x_nucleo_iks01a1_humidity.h"
//#include "x_nucleo_iks01a1_pressure.h"
//#include "x_nucleo_iks01a1_temperature.h"
#include "x_nucleo_iks01a1_accelero.h"
#else  /* not X_NUCLEO_IKS01A1 */
#include "x_nucleo_iks01a2_humidity.h"
#include "x_nucleo_iks01a2_pressure.h"
#include "x_nucleo_iks01a2_temperature.h"
#endif  /* X_NUCLEO_IKS01A1 */
#endif  /* SENSOR_ENABLED */
#endif  /* LRWAN_NS1 */



/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
#define STSOP_LATTITUDE ((float) 43.618622 )
#define STSOP_LONGITUDE ((float) 7.051415  )
#define MAX_GPS_POS ((int32_t) 8388607  ) // 2^23 - 1
#define MAX_SAMPLES 1024
#define LORAWAN_APP_PORT                            2
#define LORAWAN_DEFAULT_CONFIRM_MSG_STATE           LORAWAN_UNCONFIRMED_MSG
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
extern arm_rfft_fast_instance_f32 real_fft_Instance;
/* Private function prototypes -----------------------------------------------*/
/* Exported functions ---------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/
#if defined(SENSOR_ENABLED) || defined (LRWAN_NS1)
//void *HUMIDITY_handle = NULL;
//void *TEMPERATURE_handle = NULL;
//void *PRESSURE_handle = NULL;
void *ACCELERO_handle = NULL;

extern lora_AppData_t AppData;
//x axis states for MVA
float32_t states[] = {34-3*2.8458,310.7724-3*2.9963,6*2.8458,6*2.9963,
					  66.5134-3*2.8458,6.4728-3*2.2072,6*2.8458,6*2.2072,
					  100-3*2.8458,12.6316-3*1.5879,6*2.8458,6*1.5879};
float32_t square[] = {25,0,10,315.5304,61,0,10,13.1694,93,0,10,16.0143};
#endif

void BSP_sensor_Read( sensor_t *sensor_data)
{
  /* USER CODE BEGIN 5 */

  SensorAxes_t ACCELERO_Value;
  ACCELERO_Value.AXIS_X = (int32_t)0;
  ACCELERO_Value.AXIS_Y = (int32_t)0;
  ACCELERO_Value.AXIS_Z = (int32_t)0;
  short unsigned int k = 0;
  uint8_t drdy;
  float32_t datax[MAX_SAMPLES]; //in g instead of mg
  //float32_t datay[MAX_SAMPLES]; //in g instead of mg
  //float32_t dataz[MAX_SAMPLES]; //in g instead of mg
  float32_t fftx[MAX_SAMPLES];
  //float32_t ffty[MAX_SAMPLES];
  //float32_t fftz[MAX_SAMPLES];
  uint8_t warning[3];



#if defined(SENSOR_ENABLED) || defined (LRWAN_NS1)
  while(k<MAX_SAMPLES){
	  if(BSP_ACCELERO_Get_DRDY_Status(ACCELERO_handle,&drdy) == COMPONENT_OK){
		  if(drdy != 0){
			  BSP_ACCELERO_Get_Axes( ACCELERO_handle,  &ACCELERO_Value);
			  datax[k] = (float32_t)(ACCELERO_Value.AXIS_X)/1000.0f;
			  //datay[k] = (float32_t)(ACCELERO_Value.AXIS_Y)/1000.0f;
			  //dataz[k] = (float32_t)(ACCELERO_Value.AXIS_Z)/1000.0f;
			  k++;
		  	  }
	  	  }
	  else {
		  PRINTF("ERROR! While checking data ready");
	  	  }
  	  }

#endif  


  do_fft(datax,fftx);
  //fault_detection(fftx,square,warning);
  fault_detection_max(fftx,states,warning);

//  PRINTF("%d, %d, %d \n",warning[0],warning[1],warning[2]);

  sensor_data->x_accelero_peak1 = warning[0];
  sensor_data->x_accelero_peak2 = warning[1];
  sensor_data->x_accelero_peak3 = warning[2];

  //PRINTF("%d, %d, %d \n",sensor_data->x_accelero_peak1,sensor_data->x_accelero_peak2,sensor_data->x_accelero_peak3);


 // do_fft(datay,ffty);
  //warning = fault_detection_max(ffty,states);

 // do_fft(dataz,fftz);
  //warning = fault_detection_max(fftz,states);


	  if ( LORA_JoinStatus () != LORA_SET)
	  {
	    /*Not joined, try again later*/
	    LORA_Join();
	    return;
	  }

	  PRINTF("SEND REQUEST\n\r");

	  AppData.Port = LORAWAN_APP_PORT;

	  parseMessage(sensor_data,AppData.Buff);

	  AppData.BuffSize = strlen(AppData.Buff);
//
//	  for(k=0;k<AppData.BuffSize;k++)
//		  PRINTF("%c",AppData.Buff[k]);


	  LORA_send( &AppData, LORAWAN_DEFAULT_CONFIRM_MSG_STATE);

	  /* USER CODE END 3 */






//  for(k=0;k<MAX_SAMPLES;k++){
// 	  PRINTF("%d, %f \n",k,fftx[k]);
// 	  HAL_Delay(10);
//  }



  /* USER CODE END 5 */
}

void  BSP_sensor_Init( void  )
{
  /* USER CODE BEGIN 6 */

#if defined(SENSOR_ENABLED) || defined (LRWAN_NS1)
  /* Initialize sensors */
  BSP_ACCELERO_Init(ACCELERO_SENSORS_AUTO, &ACCELERO_handle);
  
  /* Enable sensors */
  BSP_ACCELERO_Sensor_Enable(ACCELERO_handle);

  /* Set Accelerometer ODR. Use Set_ODR_Value to avoid errors.
   * Set Full Scale in order to read up to 8g instead of 2g.
   */
  if(BSP_ACCELERO_Set_ODR_Value(ACCELERO_handle,952.0f) != COMPONENT_OK) PRINTF("Error! Setting ODR");
  if(BSP_ACCELERO_Set_FS_Value(ACCELERO_handle,8.0f) != COMPONENT_OK) PRINTF("Error! Setting FS");

  /*Initialize fft functions from arm_math */
  arm_rfft_fast_init_f32(&real_fft_Instance, MAX_SAMPLES);

#endif
    /* USER CODE END 6 */
}

void parseMessage(sensor_t* sensors,char buffer[]){


	char x1[10],x2[10],x3[10];


	//parsing
	sprintf(x1,"%u",sensors->x_accelero_peak1);
	sprintf(x2,"%u",sensors->x_accelero_peak2);
	sprintf(x3,"%u",sensors->x_accelero_peak3);



	//json string creation

	strcpy(buffer,"{\"X Axis 1\":");
	strcat(buffer,x1);

	strcat(buffer,",\"X Axis 2\":");
	strcat(buffer,x2);

	strcat(buffer,",\"X Axis 3\":");
	strcat(buffer,x3);
	strcat(buffer,"}");
//	int i= 0;

//	while(strcmp(temp[i],"\0")){
//		PRINTF("%c",temp[i]);
//		i++;
//		HAL_Delay(20);
//		}
}

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/

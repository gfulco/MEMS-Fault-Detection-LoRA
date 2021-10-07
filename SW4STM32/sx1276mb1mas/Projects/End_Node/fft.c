/**
  ******************************************************************************
  * @file    fft.c
  * @author  Martin Polacek
  * @brief   FFT demo driver
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT(c) 2017 STMicroelectronics</center></h2>
  *
  * Redistribution and use in source and binary forms, with or without modification,
  * are permitted provided that the following conditions are met:
  *   1. Redistributions of source code must retain the above copyright notice,
  *      this list of conditions and the following disclaimer.
  *   2. Redistributions in binary form must reproduce the above copyright notice,
  *      this list of conditions and the following disclaimer in the documentation
  *      and/or other materials provided with the distribution.
  *   3. Neither the name of STMicroelectronics nor the names of its contributors
  *      may be used to endorse or promote products derived from this software
  *      without specific prior written permission.
  *
  * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
  * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
  * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
  * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
  * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  *
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/

#include "fft.h"
#include "flat_top_win.h"
#include <stdlib.h>
#include "arm_math.h"
#include "util_console.h"


/* Do not change following defines */
#define MAX_SAMPLES             1024


/* Typedefs ------------------------------------------------------------------*/

typedef struct
{
  uint8_t     hp_filter;
  uint8_t     switch_HP_to_DC_null;
  uint16_t    magnitude;
  uint16_t    samples;
} fft_settings_t;

typedef struct
{
  uint32_t    max_index;
  float32_t   max_value;
  uint32_t    bin_max_index;
  float32_t   bin_max_value;
  uint32_t    ftw_max_index;
  float32_t   ftw_max_value;
} fft_out_data_t;

/* Extern variables ----------------------------------------------------------*/

/* Private macros ------------------------------------------------------------*/


/* Private variables ---------------------------------------------------------*/
//float32_t fft_input[MAX_SAMPLES];
//float32_t fft_output[MAX_SAMPLES];




arm_rfft_fast_instance_f32 real_fft_Instance;


fft_settings_t   settings = {.magnitude = 1000, .hp_filter = 0, .switch_HP_to_DC_null = 0, .samples = 1024 };
fft_out_data_t   out_data = {.max_index = 0, .max_value = 0, .bin_max_index = 0, .ftw_max_index = 0, .ftw_max_value = 0};
uint16_t         freq_axis[50];


/* Private function prototypes -----------------------------------------------*/


/* Public function prototypes ------------------------------------------------*/



/* Private functions ---------------------------------------------------------*/

void do_fft(float32_t fft_input[], float32_t fft_output[])
{
  uint32_t ifft_flag = 0;
  uint16_t i, j;
  float32_t fft_tmp[MAX_SAMPLES];
  float32_t fft_tmp2[MAX_SAMPLES];
  float32_t fft_text_plot_data[51];
  int16_t   tmp_array[MAX_SAMPLES];

  for (i = 0; i < 51; i++)
  {
    fft_text_plot_data[i] = 0;
  }

  for (i = 0; i < settings.samples; i++)
  {
    fft_tmp[i] = fft_input[i];
  }

  /* Calculate FFT */
  arm_rfft_fast_f32(&real_fft_Instance, fft_tmp, fft_tmp2, ifft_flag);

  /* Process the data through the Complex Magnitude Module for
  calculating the magnitude at each bin */
  arm_cmplx_mag_f32(fft_tmp2, fft_output, settings.samples);


  /* Flat Top window is supported only when HP filter is on */
  if (!settings.switch_HP_to_DC_null && settings.hp_filter)
  {

    for (i = 0; i < settings.samples; i++)
    {
      fft_tmp[i] = fft_input[i] * flatTopWin[i * (1024 / settings.samples)];
    }

    /* Calculate FFT using Flat Top window */
    arm_rfft_fast_f32(&real_fft_Instance, fft_tmp, fft_tmp2, ifft_flag);

    /* Process the data through the Complex Magnitude Module for
    calculating the magnitude at each bin */
    arm_cmplx_mag_f32(fft_tmp2, fft_tmp, settings.samples);
  }



}

void fault_detection(float32_t fft_output[],float32_t states[],uint8_t state[]){
int i;


//parsing states for peak 1
float32_t x1 = states[0];
float32_t y1 = states[1];
float32_t width1 = states[2];
float32_t heigth1 = states[3];
float32_t x2 = states[4];
float32_t y2 = states[5];
float32_t width2 = states[6];
float32_t heigth2 = states[7];
float32_t x3 = states[8];
float32_t y3 = states[9];
float32_t width3 = states[10];
float32_t heigth3 = states[11];
float32_t temp[120];
uint8_t offset = 20;
uint8_t check1 = 0;
uint8_t check2 = 0;

for(i = 0;i<120;i++)
	temp[i] = fft_output[i];

temp[0]=0;

arm_max_f32(temp, 120, &out_data.max_value, &out_data.max_index);

uint32_t max1 = out_data.max_index;
float32_t amp1 = out_data.max_value;

//first peak checking
if(max1 > x1+width1 || max1 < x1 )
	state[0] =  100;
else if (amp1 > y1+heigth1 )
	state[0] = 50;
else if(amp1 > y1+heigth1+heigth1*0.2)
	state[0] = 100;
else
	state[0] = 0;

//remove first peak and repeat
PRINTF("MAX1 = %d, %f \n",max1,amp1);

for(i=0;i<120;i++){
	if(i<max1+offset)
		temp[i] = 0;
}

arm_max_f32(temp, 120, &out_data.max_value, &out_data.max_index);

uint32_t max2 = out_data.max_index;
float32_t amp2 = out_data.max_value;

PRINTF("MAX2 = %d, %f\n",max2,amp2);

if(max2 < x2+width2 && max2 > x2 ){
	check1 = 1;
	if (amp2 > y2+heigth2 )
		state[check1] = 50;
	else if(amp2 > y2+heigth2+heigth2*0.2)
		state[check1] = 100;
	else
		state[check1] = 0;
}
else if(max2 < x3+width3 && max2 > x3 ){
	check1 = 2;
	if (amp2 > y3+heigth3 )
		state[check1] = 50;
	else if(amp2 > y3+heigth3+heigth3*0.2)
		state[check1] = 100;
	else
		state[check1] = 0;
}
else{
	check1 = 0;
	}
//third peak

//PRINTF("CHECK1= %d\n",check1);
for(i=0;i<120;i++)
{
	if(i<max2+offset && i>max2-offset)
		temp[i] = 0;
}



arm_max_f32(temp, 120, &out_data.max_value, &out_data.max_index);

uint32_t max3 = out_data.max_index;
float32_t amp3 = out_data.max_value;

PRINTF("MAX3 = %d, %f \n",max3,amp3);

if(check1 == 1){
	if(max3 < x3+width3 && max3 > x3 ){
		check2 = 2;
		if (amp3 > y3+heigth3 )
			state[check2] = 50;
		else if(amp3 > y3+heigth3+heigth3*0.2)
			state[check2] = 100;
		else
			state[check2] = 0;
	}
	else{
		check2 = 0;
		state [2]  = 100;
	}
}
else if (check1 == 2){
	if(max3 < x2+width2 && max2 > x2 ){
		check2 = 1;
		if (amp3 > y2+heigth2 )
			state[check2] = 50;
		else if(amp3 > y2+heigth2+heigth2*0.2)
			state[check2] = 100;
		else
			state[check2] = 0;
	}
	else{
		check2 = 0;
		state [1]  = 100;
	}
}
else if (check1 == 0){
	if(max3 < x2+width2 && max2 > x2 ){
		check2 = 1;
	if (amp3 > y2+heigth2 )
			state[check2] = 50;
	else if(amp3 > y2+heigth2+heigth2*0.2)
			state[check2] = 100;
	else
			state[check2] = 0;
	state[2] = 100;
	}
	else if(max3 < x3+width3 && max3 > x3 ){
		check2 = 2;
		if (amp3 > y3+heigth3 )
			state[check2] = 50;
		else if(amp3 > y3+heigth3+heigth3*0.2)
			state[check2] = 100;
		else
			state[check2] = 0;
	state[1] = 100;
	}
	else {
		state[1] = 100;
		state[2] = 100;
		check2 = 0;
	}

}


//PRINTF("CHECK2= %d\n",check2);

}

void fault_detection_max(float32_t fft_output[],float32_t states[],uint8_t state[]){

	//parsing states for peak 1
	float32_t x1 = states[0];
	float32_t y1 = states[1];
	float32_t width1 = states[2];
	float32_t heigth1 = states[3];
	float32_t x2 = states[4];
	float32_t y2 = states[5];
	float32_t width2 = states[6];
	float32_t heigth2 = states[7];
	float32_t x3 = states[8];
	float32_t y3 = states[9];
	float32_t width3 = states[10];
	float32_t heigth3 = states[11];
	float32_t temp[120];
	uint8_t offset = 20;
	uint8_t check1 = 0;
	uint8_t check2 = 0;
	int i;

	for(i = 0;i<120;i++)
		temp[i] = fft_output[i];

	temp[0]=0;

	arm_max_f32(temp, 120, &out_data.max_value, &out_data.max_index);

	uint32_t max1 = out_data.max_index;
	float32_t amp1 = out_data.max_value;

	//first peak checking
	if(max1 > x1+width1 || max1 < x1 )
		state[0] =  100;
	else if (amp1 > y1+heigth1 )
		state[0] = 100;
	else if(amp1 < y1)
		state[0] = 100;
	else
		state[0] = 0;

	//remove first peak and repeat
	PRINTF("MAX1 = %d, %f \n",max1,amp1);

	for(i=0;i<120;i++){
		if(i<max1+offset)
			temp[i] = 0;
	}

	arm_max_f32(temp, 120, &out_data.max_value, &out_data.max_index);

	uint32_t max2 = out_data.max_index;
	float32_t amp2 = out_data.max_value;

	PRINTF("MAX2 = %d, %f\n",max2,amp2);

	if(max2 < x2+width2 && max2 > x2 ){
		check1 = 1;
		if (amp2 > y2+heigth2 )
			state[check1] = 100;
		else if(amp2 < y2)
			state[check1] = 100;
		else
			state[check1] = 0;
	}
	else if(max2 < x3+width3 && max2 > x3 ){
		check1 = 2;
		if (amp2 > y3+heigth3 )
			state[check1] = 100;
		else if(amp2 < y3)
			state[check1] = 100;
		else
			state[check1] = 0;
	}
	else{
		check1 = 0;
		}
	//third peak

	//PRINTF("CHECK1= %d\n",check1);
	for(i=0;i<120;i++)
	{
		if(i<max2+offset && i>max2-offset)
			temp[i] = 0;
	}



	arm_max_f32(temp, 120, &out_data.max_value, &out_data.max_index);

	uint32_t max3 = out_data.max_index;
	float32_t amp3 = out_data.max_value;

	PRINTF("MAX3 = %d, %f \n",max3,amp3);

	if(check1 == 1){
		if(max3 < x3+width3 && max3 > x3 ){
			check2 = 2;
			if (amp3 > y3+heigth3 )
				state[check2] = 100;
			else if(amp3 < y3)
				state[check2] = 100;
			else
				state[check2] = 0;
		}
		else{
			check2 = 0;
			state [2]  = 100;
		}
	}
	else if (check1 == 2){
		if(max3 < x2+width2 && max2 > x2 ){
			check2 = 1;
			if (amp3 > y2+heigth2 )
				state[check2] = 100;
			else if(amp3 < y2)
				state[check2] = 100;
			else
				state[check2] = 0;
		}
		else{
			check2 = 0;
			state [1]  = 100;
		}
	}
	else if (check1 == 0){
		if(max3 < x2+width2 && max2 > x2 ){
			check2 = 1;
		if (amp3 > y2+heigth2 )
				state[check2] = 100;
		else if(amp3 < y2)
				state[check2] = 100;
		else
				state[check2] = 0;
		state[2] = 100;
		}
		else if(max3 < x3+width3 && max3 > x3 ){
			check2 = 2;
			if (amp3 > y3+heigth3 )
				state[check2] = 100;
			else if(amp3 < y3)
				state[check2] = 100;
			else
				state[check2] = 0;
		state[1] = 100;
		}
		else {
			state[1] = 100;
			state[2] = 100;
			check2 = 0;
		}

	}


	//PRINTF("CHECK2= %d\n",check2);

	}

// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

//////////////////////////////////////////////////////////////////////////////////
//                                                                              //
//                                                                              //
//  Author: meisq                                                               //
//          msq@qq.com                                                          //
//          ALINX(shanghai) Technology Co.,Ltd                                  //
//          heijin                                                              //
//     WEB: http://www.alinx.cn/                                                //
//     BBS: http://www.heijin.org/                                              //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////
//                                                                              //
// Copyright (c) 2017,ALINX(shanghai) Technology Co.,Ltd                        //
//                    All rights reserved                                       //
//                                                                              //
// This source file may be used and distributed without restriction provided    //
// that this copyright statement is not removed from the file and that any      //
// derivative work contains the original copyright notice and the associated    //
// disclaimer.                                                                  //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////

//==========================================================================
//  Revision History:
//  Date          By            Revision    Change Description
//--------------------------------------------------------------------------
//  2017/6/21    meisq         1.0         Original
//*************************************************************************/
module sd_card_audio(
	input                       clk,
	input                       rst_n,
	input                       key1,
	output[3:0]                 state_code,
	input                       bclk,         //audio bit clock
	input                       daclrc,       //DAC sample rate left right clock
	output                      dacdat,       //DAC audio data output 
	input                       adclrc,       //ADC sample rate left right clock
	input                       adcdat,       //ADC audio data input
	output                      sd_ncs,       //SD card chip select (SPI mode)  
	output                      sd_dclk,      //SD card clock
	output                      sd_mosi,      //SD card controller data output
	input                       sd_miso       //SD card controller data input
);
wire             button_negedge;              //press button ,one clock cycle    
wire             sd_sec_read;                 //SD card sector read
wire[31:0]       sd_sec_read_addr;            //SD card sector read address
wire[7:0]        sd_sec_read_data;            //SD card sector read data
wire             sd_sec_read_data_valid;      //SD card sector read data valid
wire             sd_sec_read_end;             //SD card sector read end
wire             wav_data_wr_en;              //wav audio data write enable
wire[7:0]        wav_data;                    //wav audio data
wire[15:0]       wr_data_count;               //fifo write Used Words
wire[31:0]       read_data;                   //fifo read data
wire             read_data_en;                //fifo read enable
wire             empty;                     //fifo read empty
wire[31:0]       tx_left_data;                //left channel audio data
wire[31:0]       tx_right_data;               //right channel audio data
wire             sd_init_done;                //SD card initialization completed
assign tx_left_data = {16'd0,read_data[7:0],read_data[15:8]};
assign tx_right_data = {16'd0,read_data[23:16],read_data[31:24]};

ax_debounce#(.FREQ(100)) ax_debounce_m0
(
	.clk             (clk),
	.rst             (~rst_n),
	.button_in       (key1),
	.button_posedge  (),
	.button_negedge  (button_negedge),
	.button_out      ()
);

audio_tx audio_tx_m0
(
	.rst                       (~rst_n                     ),        
	.clk                       (clk                        ),
	.sck_bclk                  (bclk                       ),
	.ws_lrc                    (adclrc                     ),
	.sdata                     (dacdat                     ),
	.left_data                 (tx_left_data               ),
	.right_data                (tx_right_data              ),
	.read_data_en              (read_data_en               )
);

afifo_8i_32o_1024 audio_buf
(
	.rd_clk                    (clk                        ),          // Read side clock
	.wr_clk                    (clk                        ),          // Write side clock
	.rst                       (1'b0                       ),          // Asynchronous clear
	.wr_en                     (wav_data_wr_en             ),          // Write Request
	.rd_en                     (read_data_en & ~empty      ),          // Read Request
	.din                       (wav_data                   ),          // Input Data
	.empty                     (empty                      ),          // Read side Empty flag
	.full                      (                           ),          // Write side Full flag
	.rd_data_count             (                           ),          // Read Used Words
	.wr_data_count             (wr_data_count[9:0]         ),          // Write Used Words
	.dout                      (read_data                  )
);

wav_read wav_read_m0(
	.clk                       (clk                        ),
	.rst                       (~rst_n                     ),
	.ready                     (                           ),
	.find                      (button_negedge             ),
	.sd_init_done              (sd_init_done               ),
	.state_code                (state_code                 ),
	.sd_sec_read               (sd_sec_read                ),
	.sd_sec_read_addr          (sd_sec_read_addr           ),
	.sd_sec_read_data          (sd_sec_read_data           ),
	.sd_sec_read_data_valid    (sd_sec_read_data_valid     ),
	.sd_sec_read_end           (sd_sec_read_end            ),
	.fifo_wr_cnt               (wr_data_count              ),
	.wav_data_wr_en            (wav_data_wr_en             ),
	.wav_data                  (wav_data                   )
);
sd_card_top  sd_card_top_m0(
	.clk                       (clk                        ),
	.rst                       (~rst_n                     ),
	.SD_nCS                    (sd_ncs                     ),
	.SD_DCLK                   (sd_dclk                    ),
	.SD_MOSI                   (sd_mosi                    ),
	.SD_MISO                   (sd_miso                    ),
	.sd_init_done              (sd_init_done               ),
	.sd_sec_read               (sd_sec_read                ),
	.sd_sec_read_addr          (sd_sec_read_addr           ),
	.sd_sec_read_data          (sd_sec_read_data           ),
	.sd_sec_read_data_valid    (sd_sec_read_data_valid     ),
	.sd_sec_read_end           (sd_sec_read_end            ),
	.sd_sec_write              (1'b0                       ),
	.sd_sec_write_addr         (32'd0                      ),
	.sd_sec_write_data         (                           ),
	.sd_sec_write_data_req     (                           ),
	.sd_sec_write_end          (                           )
);
endmodule 
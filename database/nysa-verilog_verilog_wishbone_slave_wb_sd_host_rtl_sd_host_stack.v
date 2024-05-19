// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

/*
Distributed under the MIT license.
Copyright (c) 2015 Dave McCoy (dave.mccoy@cospandesign.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

/*
 * Author: David McCoy (dave.mccoy@cospandesign.com)
 * Description: SDIO Host Stack
 *
 * Changes:
 */

module sd_host_stack #(
  parameter                 SD_MODE       = 0,
  parameter                 FOUR_BIT_DATA = 0,
  parameter                 DDR_EN        = 0,
  parameter                 BUFFER_DEPTH  = 11  //2048
)(
  input                     clk,
  input                     rst,

  //Configuration
  output                    o_sd_ready,
  input                     i_card_detect,
  input       [15:0]        i_timeout,
  input                     i_crc_en_flag,
  output                    o_sd_int_detected,

  output                    o_error_flag,
  output      [7:0]         o_error,

  //Command/Response Interface
  input                     i_cmd_en,
  input       [5:0]         i_cmd,
  input       [31:0]        i_cmd_arg,
  output                    o_cmd_finished_en,

  //Flags
  input                     i_rsp_long_flag,

  output      [127:0]       o_rsp,

  //Data Interface
  input                     i_data_txrx,
  input                     i_data_write_flag,
  input       [23:0]        i_data_size,
  output                    o_data_txrx_finished,
  input       [2:0]         i_func_addr,
  input                     i_data_block_mode,
  input       [31:0]        i_block_sleep_count,

  input       [23:0]        i_f0_block_size,
  input       [23:0]        i_f1_block_size,
  input       [23:0]        i_f2_block_size,
  input       [23:0]        i_f3_block_size,
  input       [23:0]        i_f4_block_size,
  input       [23:0]        i_f5_block_size,
  input       [23:0]        i_f6_block_size,
  input       [23:0]        i_f7_block_size,
  input       [23:0]        i_mem_block_size,


  //Data From Host to SD Interface
  output      [1:0]         o_h2s_wfifo_ready,
  input       [1:0]         i_h2s_wfifo_activate,
  output      [23:0]        o_h2s_wfifo_size,
  input                     i_h2s_wfifo_stb,
  input       [31:0]        i_h2s_wfifo_data,

  //Data From SD to Host Interface
  output                    o_s2h_rfifo_ready,
  input                     i_s2h_rfifo_activate,
  output      [23:0]        o_s2h_rfifo_size,
  input                     i_s2h_rfifo_stb,
  output      [31:0]        o_s2h_rfifo_data,

  //Interrupt From the Card
  output                    o_interrupt,

  //Phy Interface
  input                     i_sd_pll_locked,
  input                     i_sd_clk,

  output                    o_read_wait,
  output                    o_sd_cmd_dir,
  input                     i_sd_cmd,
  output                    o_sd_cmd,

  //FPGA Debug Interface
  output      [3:0]         o_phy_state,
  output      [3:0]         o_phy_data_state,

  output      [7:0]         o_gen_crc,
  output      [7:0]         o_rmt_crc,

  output      [15:0]        o_crc0_data_rmt,
  output      [15:0]        o_crc1_data_rmt,
  output      [15:0]        o_crc2_data_rmt,
  output      [15:0]        o_crc3_data_rmt,

  output      [15:0]        o_crc0_data_gen,
  output      [15:0]        o_crc1_data_gen,
  output      [15:0]        o_crc2_data_gen,
  output      [15:0]        o_crc3_data_gen,



  output                    o_sd_data_dir,
  input       [7:0]         i_sd_data,
  output      [7:0]         o_sd_data
);


//local parameters
//registes/wires
wire                        phy_cmd_en;
wire          [39:0]        phy_cmd;
wire          [7:0]         phy_cmd_len;
wire          [7:0]         phy_rsp_len;
wire          [135:0]       phy_rsp;
wire                        phy_rsp_finished_en;


wire                        rfifo_rdy;
wire                        rfifo_act;
wire                        rfifo_stb;
wire          [23:0]        rfifo_size;
wire          [31:0]        rfifo_data;

wire          [1:0]         wfifo_rdy;
wire          [1:0]         wfifo_act;
wire                        wfifo_stb;
wire          [23:0]        wfifo_size;
wire          [31:0]        wfifo_data;

wire                        sd_clk_locked;

wire                        sd_cmd_en;
wire                        sd_cmd_finished_en;

wire                        data_txrx_activate;
wire                        data_txrx_finished;
wire          [11:0]        data_byte_count;
wire                        data_write_flag;
wire                        data_crc_read_err;





cross_clock_enable ccstb_cmd_enable(
  .rst                (rst || !i_sd_pll_locked    ),
  .in_en              (i_cmd_en                   ),

  .out_clk            (i_sd_clk                   ),
  .out_en             (sd_cmd_en                  )
);


cross_clock_enable ccstb_cmd_finished_en(
  .rst                (rst || !i_sd_pll_locked    ),
  .in_en              (sd_cmd_finished_en         ),

  .out_clk            (clk                        ),
  .out_en             (o_cmd_finished_en          )
);


//submodules

//Ping Pong FIFO in/out
ppfifo #(
  .DATA_WIDTH         (32                         ),
  .ADDRESS_WIDTH      (BUFFER_DEPTH               )
)h2s(
  .reset              (rst  || !i_sd_pll_locked   ),
  .write_clock        (clk                        ),
  .write_ready        (o_h2s_wfifo_ready          ),
  .write_activate     (i_h2s_wfifo_activate       ),
  .write_fifo_size    (o_h2s_wfifo_size           ),
  .write_strobe       (i_h2s_wfifo_stb            ),
  .write_data         (i_h2s_wfifo_data           ),

  .inactive           (o_h2s_wfifo_inactive       ),

  //Read Side
  .read_clock         (i_sd_clk                   ),
  .read_ready         (rfifo_rdy                  ),
  .read_activate      (rfifo_act                  ),
  .read_strobe        (rfifo_stb                  ),
  .read_count         (rfifo_size                 ),
  .read_data          (rfifo_data                 )
);

ppfifo #(
  .DATA_WIDTH         (32                         ),
  .ADDRESS_WIDTH      (BUFFER_DEPTH               )
)s2h(
  .reset              (rst  || !i_sd_pll_locked   ),
  .write_clock        (i_sd_clk                   ),
  .write_ready        (wfifo_rdy                  ),
  .write_activate     (wfifo_act                  ),
  .write_fifo_size    (wfifo_size                 ),
  .write_strobe       (wfifo_stb                  ),
  .write_data         (wfifo_data                 ),

  .inactive           (o_s2h_wfifo_inactive       ),

  //Read Side
  .read_clock         (clk                        ),
  .read_ready         (o_s2h_rfifo_ready          ),
  .read_activate      (i_s2h_rfifo_activate       ),
  .read_strobe        (i_s2h_rfifo_stb            ),
  .read_count         (o_s2h_rfifo_size           ),
  .read_data          (o_s2h_rfifo_data           )
);


sd_cmd_layer cmd(
  .clk                  (i_sd_clk                 ),
  .rst                  (rst  || !i_sd_pll_locked ),

  //Initiate a command
  .o_sd_ready           (o_sd_ready               ),
  .i_card_detect        (i_card_detect            ),
  .i_timeout            (i_timeout                ),
  .i_crc_enable_flag    (i_crc_en_flag            ),

  .o_error_flag         (o_error_flag             ),
  .o_error              (o_error                  ),

  //Data Interface
  .i_data_read_stb      (rfifo_stb                ),
  .i_data_write_stb     (wfifo_stb                ),
  .i_data_txrx          (i_data_txrx              ),
  .i_data_write_flag    (i_data_write_flag        ),
  .i_data_size          (i_data_size              ),
  .o_data_txrx_finished (o_data_txrx_finished     ),
  .i_data_block_mode    (i_data_block_mode        ),
  .i_func_addr          (i_func_addr              ),

  //User Command/Response Interface
  .i_cmd_en             (sd_cmd_en                ),
  .o_cmd_finished_en    (sd_cmd_finished_en       ),

  .i_cmd                (i_cmd                    ),
  .i_cmd_arg            (i_cmd_arg                ),

  //Flags
  .i_rsp_long           (i_rsp_long_flag          ),
  .o_rsp                (o_rsp                    ),

  //Interrupt From the Card
  .o_interrupt          (o_interrupt              ),
  .i_block_sleep_count  (i_block_sleep_count      ),

  //Block Size for layers
  .i_f0_block_size      (i_f0_block_size          ),
  .i_f1_block_size      (i_f1_block_size          ),
  .i_f2_block_size      (i_f2_block_size          ),
  .i_f3_block_size      (i_f3_block_size          ),
  .i_f4_block_size      (i_f4_block_size          ),
  .i_f5_block_size      (i_f5_block_size          ),
  .i_f6_block_size      (i_f6_block_size          ),
  .i_f7_block_size      (i_f7_block_size          ),
  .i_mem_block_size     (i_mem_block_size         ),

  //PHY Layer
  .o_phy_cmd_en         (phy_cmd_en               ),
  .o_phy_cmd            (phy_cmd                  ),
  .o_phy_cmd_len        (phy_cmd_len              ),

  .i_phy_rsp_finished_en(phy_rsp_finished_en      ),
  .i_phy_rsp            (phy_rsp                  ),
  .o_phy_rsp_len        (phy_rsp_len              ),

  .i_phy_crc_bad        (phy_crc_bad              ),


  .o_data_txrx_activate (data_txrx_activate       ),
  .i_data_txrx_finished (data_txrx_finished       ),
  .o_data_byte_count    (data_byte_count          ),
  .o_data_write_flag    (data_write_flag          ),
  .i_data_crc_read_err  (data_crc_read_err        )

);

sd_phy_layer #(
  .SD_MODE              (SD_MODE                  ),
  .FOUR_BIT_DATA        (FOUR_BIT_DATA            ),
  .DDR_EN               (DDR_EN                   )
)phy (
  .rst                  (rst  || !i_sd_pll_locked ),
  .o_sd_int_detected    (o_sd_int_detected        ),

  //Coniguration
  //Command/Response Interface
  .i_cmd_en             (phy_cmd_en               ),
  .i_cmd                (phy_cmd                  ),
  .i_cmd_len            (phy_cmd_len              ),

  .o_rsp                (phy_rsp                  ),
  .i_rsp_len            (phy_rsp_len              ),
  .o_rsp_finished_en    (phy_rsp_finished_en      ),

  //Data Control
  .i_data_txrx_activate (data_txrx_activate       ),
  .o_data_txrx_finished (data_txrx_finished       ),
  .i_data_byte_count    (data_byte_count          ),
  .i_data_write_flag    (data_write_flag          ),
  .o_data_crc_read_err  (data_crc_read_err        ),

  //Data From Host to SD Interface
  .i_h2s_fifo_ready     (rfifo_rdy                ),
  .o_h2s_fifo_activate  (rfifo_act                ),
  .i_h2s_fifo_size      (rfifo_size               ),
  .o_h2s_fifo_stb       (rfifo_stb                ),
  .i_h2s_fifo_data      (rfifo_data               ),

  //Data From SD to Host Interface
  .i_s2h_fifo_ready     (wfifo_rdy                ),
  .o_s2h_fifo_activate  (wfifo_act                ),
  .i_s2h_fifo_size      (wfifo_size               ),
  .o_s2h_fifo_stb       (wfifo_stb                ),
  .o_s2h_fifo_data      (wfifo_data               ),

  .o_read_wait          (o_read_wait              ),
  .i_sd_clk             (i_sd_clk                 ),

  .o_sd_cmd_dir         (o_sd_cmd_dir             ),
  .i_sd_cmd             (i_sd_cmd                 ),
  .o_sd_cmd             (o_sd_cmd                 ),

  //Debug Interface
  .o_state              (o_phy_state              ),
  .o_data_state         (o_phy_data_state         ),
  .o_gen_crc            (o_gen_crc                ),
  .o_rmt_crc            (o_rmt_crc                ),

  .o_crc0_data_rmt      (o_crc0_data_rmt          ),
  .o_crc1_data_rmt      (o_crc1_data_rmt          ),
  .o_crc2_data_rmt      (o_crc2_data_rmt          ),
  .o_crc3_data_rmt      (o_crc3_data_rmt          ),
                        
  .o_crc0_data_gen      (o_crc0_data_gen          ),
  .o_crc1_data_gen      (o_crc1_data_gen          ),
  .o_crc2_data_gen      (o_crc2_data_gen          ),
  .o_crc3_data_gen      (o_crc3_data_gen          ),



  .o_sd_data_dir        (o_sd_data_dir            ),
  .i_sd_data            (i_sd_data                ),
  .o_sd_data            (o_sd_data                )
);

//Clock Generator

//asynchronous logic
//synchronous logic

endmodule

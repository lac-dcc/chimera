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
 * Author:
 * Description:
 *
 * Changes:
 */


`define HOST_DATA_DELAY_FIXED

module sd_host_platform_spartan6 #(
  parameter                 OUTPUT_DELAY  = 0,
  parameter                 INPUT_DELAY   = 0
)(
  input                     rst,
  input                     clk,
  output                    o_locked,
  input                     i_read_wait,

  output                    o_sd_clk,

  input                     i_sd_data_dir,
  input           [7:0]     i_sd_data_out,
  output          [7:0]     o_sd_data_in,

  input                     i_sd_cmd_dir,
  input                     i_sd_cmd_out,
  output                    o_sd_cmd_in,

  //Configuration
  input                     i_cfg_inc,
  input                     i_cfg_en,

  output                    o_phy_clk,
  inout                     io_phy_cmd,
  inout           [3:0]     io_phy_data

);
//local parameters

localparam                 USER_RESET_TIMEOUT  = 4'hF;
//registes/wires
wire                [7:0]   sd_data_out;
wire                        pll_serdes_clk;
wire                        pll_sd_clk;

wire                        ddr_clk_delay;

wire                        ddr_clk;

wire                        sd_cmd_tristate_dly;
wire                        sd_cmd_out_delay;
wire                        sd_cmd_in_delay;

wire                [3:0]   pin_data_out;
wire                [3:0]   pin_data_in;
wire                [3:0]   pin_data_tristate;

wire                [3:0]   pin_data_out_delay;
wire                [3:0]   pin_data_in_predelay;
wire                [3:0]   pin_data_tristate_predelay;
wire                        serdes_strobe;

wire                        din_serdes_strobe_buf;
reg                         sd_clk;
//wire                        !o_sd_clk;
reg                         user_reset = 1;
reg                 [3:0]   user_reset_count = 0;
wire                        sd_data_direction;


//submodules

//Generate the SERDES

//Clock will be used to drive both the output and the internal state machine
//Take the output of the delay buffer and send it through ODDR2
ODDR2 #(
  .DDR_ALIGNMENT        ("NONE"                           ),
  .INIT                 (1'b0                             ),
  .SRTYPE               ("SYNC"                           )
) oddr2_clk (
  .D0                   (1'b1                             ),
  .D1                   (1'b0                             ),
  .C0                   (o_sd_clk                         ),
  .C1                   (!o_sd_clk                        ),
  .CE                   (1'b1                             ),
  .Q                    (o_phy_clk                        ),
  .R                    (1'b0                             ),
  .S                    (1'b0                             )
);

//Internal Clock Interface
//Control Line
IOBUF #(
  .IOSTANDARD           ("LVCMOS33"                       )
) cmd_iobuf (
  .T                    (sd_cmd_tristate_dly              ),
  .O                    (sd_cmd_in_delay                  ),
  .I                    (sd_cmd_out_delay                 ),

  .IO                   (io_phy_cmd                       )
);

IODELAY2 #(
  .DATA_RATE            ("SDR"                            ),
  .IDELAY_VALUE         (INPUT_DELAY                      ),
  .ODELAY_VALUE         (OUTPUT_DELAY                     ),
  .IDELAY_TYPE          ("FIXED"                          ),
  .COUNTER_WRAPAROUND   ("STAY_AT_LIMIT"                  ),
  .DELAY_SRC            ("IO"                             ),
  .SERDES_MODE          ("NONE"                           ),
  .SIM_TAPDELAY_VALUE   (75                               )
) cmd_delay (
  .T                    (!i_sd_cmd_dir                    ),
  .ODATAIN              (i_sd_cmd_out                     ),
  //.DATAOUT              (o_sd_cmd_in                      ),
  .DATAOUT2             (o_sd_cmd_in                      ),

  //FPGA Fabric

  //IOB
  .TOUT                 (sd_cmd_tristate_dly              ),
  .IDATAIN              (sd_cmd_in_delay                  ),
  .DOUT                 (sd_cmd_out_delay                 ),

  .IOCLK0               (o_sd_clk                         ),
  //.IOCLK1               (!o_sd_clk                        ),
  .CAL                  (1'b0                             ),
  .BUSY                 (                                 ),

  .CLK                  (clk                              ),
  .INC                  (i_cfg_inc                        ),
  .CE                   (i_cfg_en                         ),
  .RST                  (rst                              )
);

//DATA Lines

wire          [3:0]     sd_data_dir;
wire          [3:0]     sd_data_dir_predelay;

assign        sd_data_dir = {sd_data_direction, sd_data_direction, sd_data_direction, sd_data_direction};

genvar pcnt;
generate
for (pcnt = 0; pcnt < 4; pcnt = pcnt + 1) begin: sgen

IOBUF #(
  .IOSTANDARD           ("LVCMOS33"                       )
) io_data_buffer (
  .T                    (pin_data_tristate[pcnt]          ),
  .I                    (pin_data_out[pcnt]               ),
  .O                    (pin_data_in[pcnt]                ),
  .IO                   (io_phy_data[pcnt]                )
);

IODELAY2 #(
  .DATA_RATE            ("DDR"                            ),
`ifdef HOST_DATA_DELAY_FIXED
  .IDELAY_TYPE          ("FIXED"                          ),
  .IDELAY_VALUE         (INPUT_DELAY                      ),
  .ODELAY_VALUE         (OUTPUT_DELAY                     ),
`else
  .IDELAY_TYPE          ("VARIABLE_FROM_ZERO" ),
  .ODELAY_VALUE         (0                                ),
`endif
  .COUNTER_WRAPAROUND   ("STAY_AT_LIMIT"                  ),
  .DELAY_SRC            ("IO"                             ),
  .SERDES_MODE          ("NONE"                           ),
  .SIM_TAPDELAY_VALUE   (75                               )

)sd_data_delay(
  //IOSerdes
  //.T                    (1'b0),
  .T                    (sd_data_dir_predelay[pcnt]       ),
  .ODATAIN              (pin_data_in_predelay[pcnt]       ),
  .DATAOUT              (pin_data_out_delay[pcnt]         ),

  //To/From IO Buffer
  .TOUT                 (pin_data_tristate[pcnt]          ),
  .IDATAIN              (pin_data_in[pcnt]                ),
  .DOUT                 (pin_data_out[pcnt]               ),

  .BUSY                 (                                 ),
  .CAL                  (1'b0                             ),

  .IOCLK0               (o_sd_clk                         ),
  .IOCLK1               (!o_sd_clk                        ),
`ifdef HOST_DATA_DELAY_FIXED
  .CLK                  (1'b0                             ),
  .INC                  (1'b0                             ),
  .CE                   (1'b0                             ),
  .RST                  (1'b0                             )

`else
  .CLK                  (clk                              ),
  .INC                  (i_cfg_inc                        ),
  .CE                   (i_cfg_en                         ),
  .RST                  (rst                              )
`endif


);


ODDR2 #(
  .DDR_ALIGNMENT        ("C0"                             ),
  .SRTYPE               ("ASYNC"                           ),

  .INIT                 (1                                )
) data_dir_ddr (
  .C0                   (o_sd_clk                         ),
  .C1                   (!o_sd_clk                        ),
  .CE                   (1'b1                             ),
  .S                    (1'b0                             ),
  .R                    (1'b0                             ),

  .D0                   (sd_data_dir[pcnt]                ),
  .D1                   (sd_data_dir[pcnt]                ),
 // .D0                   (1'b0            ),
 // .D1                   (1'b0            ),

  .Q                    (sd_data_dir_predelay[pcnt]       )
);


IDDR2 #(
  //.DDR_ALIGNMENT        ("NONE"                           ),
  .DDR_ALIGNMENT        ("C0"                           ),
  .INIT_Q0              (1                                ),
  .INIT_Q1              (1                                ),
  .SRTYPE               ("ASYNC"                           )
  //.SRTYPE               ("SYNC"                           )
) data_in_ddr (
  .C0                   (o_sd_clk                         ),
  .C1                   (!o_sd_clk                        ),
  .CE                   (1'b1                             ),
  .S                    (1'b0                             ),
  .R                    (1'b0                             ),

  .D                    (pin_data_out_delay[pcnt]         ),
  .Q0                   (o_sd_data_in[pcnt]               ),
  .Q1                   (o_sd_data_in[pcnt + 4]           )
);
ODDR2 #(
//  .DDR_ALIGNMENT        ("NONE"                           ),
//  .SRTYPE               ("SYNC"                           ),
  .DDR_ALIGNMENT        ("C0"                           ),
  .SRTYPE               ("ASYNC"                           ),

  .INIT                 (1                                )
) data_out_ddr (
  .C0                   (o_sd_clk                         ),
  .C1                   (!o_sd_clk                        ),
  .CE                   (1'b1                             ),
  .S                    (1'b0                             ),
  .R                    (1'b0                             ),

  .D0                   (sd_data_out[pcnt + 4]            ),
  .D1                   (sd_data_out[pcnt]                ),
 // .D0                   (1'b0            ),
 // .D1                   (1'b0            ),

  .Q                    (pin_data_in_predelay[pcnt]       )

);

end
//`define ADJUSTABLE_DELAY
endgenerate

BUFG sd_clk_buffer_p(
  .I                      (sd_clk                         ),
  .O                      (o_sd_clk                       )
);
/*
BUFG sd_clk_buffer_n(
  .I                      (!sd_clk                        ),
  .O                      (!o_sd_clk                     )
);
*/

//asynchronous logic
assign  sd_data_out       = i_read_wait ? {1'b1, 1'b0, 1'b1, 1'b1, 1'b1, 1'b0, 1'b1, 1'b1}:
                                          i_sd_data_out;
//assign  sd_data_out                 = i_sd_data_out;

assign  sd_data_direction = (!i_sd_data_dir && !i_read_wait);
//assign  sd_data_direction = (!i_sd_data_dir);
assign  o_locked          = !user_reset;

//Synchronous Logic
reg [7:0] count;
always @ (posedge clk) begin
  if (rst) begin
    sd_clk                <=  0;
    count                 <=  0;
  end
  else begin
    if (count < 4) begin
      count               <=  count + 1;
    end
    else begin
      sd_clk              <=  ~sd_clk;
      count               <=  0;
    end
  end
end

initial begin
  user_reset_count        <=  0;
end

always @ (posedge o_sd_clk or posedge rst) begin
  if (rst) begin 
    user_reset            <=  1;
    user_reset_count      <=  0;
  end
  else begin
    if (user_reset_count < USER_RESET_TIMEOUT) begin
      user_reset_count    <=  user_reset_count + 1;
    end
    else begin
      user_reset          <=  0;
    end
  end
end

endmodule

// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

/*
Distributed under the MIT license.
Copyright (c) 2011 Dave McCoy (dave.mccoy@cospandesign.com)

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

`timescale 1 ns/1 ps
`include "sdram_include.v"


module sdram (

input               clk,
input               rst,

output      [31:0]  debug,

input               if_write_strobe,
input       [31:0]  if_write_data,
input       [3:0]   if_write_mask,
output      [1:0]   if_write_ready,
input       [1:0]   if_write_activate,
output      [23:0]  if_write_fifo_size,
output              if_starved,

input               of_read_strobe,
output              of_read_ready,
input               of_read_activate,
output      [23:0]  of_read_count,
output      [31:0]  of_read_data,

input               sdram_write_enable,
input               sdram_read_enable,

input       [21:0]  app_address,
output reg          sdram_ready,

output              sd_clk,
output reg          cke,
output reg          cs_n,
output              ras,
output              cas,
output              we,

input               i_wb_of_reset,

output      [11:0]  address,
output      [1:0]   bank,
inout       [15:0]  data,
output      [1:0]   data_mask,
output              ext_sdram_clk

);


wire                sdram_clock_ready;
(* KEEP = "TRUE" *) wire            sdram_clk;
assign              ext_sdram_clk = sdram_clk;

//Generate the SDRAM Clock
sdram_clkgen clkgen (
  .clk (clk),
  .rst (rst),

  .locked(sdram_clock_ready),
  .out_clk(sdram_clk),
  .phy_out_clk(sd_clk)
);


//setup the cke
always @(posedge clk) begin
  if (rst || ~sdram_clock_ready) begin
    cke <= 0;
  end
  else begin
    if (sdram_clock_ready) begin
      cke <=  1;
    end
  end
end

reg           refresh;

//Write path
wire        [2:0]   write_command;
wire        [11:0]  write_address;
wire        [1:0]   write_bank;
wire                write_idle;
wire        [1:0]   write_data_mask;
wire        [35:0]  if_read_data;
//reg               write_enable;
wire        [15:0]  data_out;

wire                writing;
assign              writing = ~write_idle;


//Write FIFO
wire                if_fifo_idle;

wire                if_read_strobe;
wire                if_read_ready;
wire                if_read_activate;
wire        [23:0]  if_read_count;
wire                if_inactive;
wire                wwfr;
wire                rwfr;
wire                of_starved;

ppfifo #(
  .DATA_WIDTH(36),
  .ADDRESS_WIDTH(9)
) ppfifo_wr (
  .reset                     (rst || ~sdram_ready            ),

  //Write
  .write_clock               (clk                            ),
  .write_ready               (if_write_ready                 ),
  .write_activate            (if_write_activate              ),
  .write_fifo_size           (if_write_fifo_size             ),
  .write_strobe              (if_write_strobe                ),
  .write_data                ({if_write_mask, if_write_data} ),

  .starved                   (if_starved                     ),

  //Read
  .read_clock                (sdram_clk                      ),
  .read_strobe               (if_read_strobe                 ),
  .read_ready                (if_read_ready                  ),
  .read_activate             (if_read_activate               ),
  .read_count                (if_read_count                  ),
  .read_data                 (if_read_data                   ),

  .inactive                  (if_inactive                    )

);


sdram_write write_path (
  .rst                       (rst || ~sdram_ready            ),
  .clk                       (sdram_clk                      ),
  .debug                     (debug                          ),

  //Write Path SDRAM Control
  .command                   (write_command                  ),
  .address                   (write_address                  ),
  .bank                      (write_bank                     ),
  .data_out                  (data_out                       ),
  .data_mask                 (write_data_mask                ),

  //Control
  .idle                      (write_idle                     ),
  .enable                    (sdram_write_enable             ),
  .auto_refresh              (refresh                        ),
  .wait_for_refresh          (wwfr                           ),

  //Application address
  .app_address               (app_address                    ),

  //Data Out Path
  .fifo_data                 (if_read_data                   ),
  .fifo_read                 (if_read_strobe                 ),
  .fifo_ready                (if_read_ready                  ),
  .fifo_activate             (if_read_activate               ),
  .fifo_size                 (if_read_count                  ),
  .fifo_inactive             (if_inactive                    )

);

//Read path
wire        [2:0]   read_command;
wire                read_idle;
wire        [11:0]  read_address;
wire        [1:0]   read_bank;

reg         [15:0]  data_in;
always @ (data) begin
  data_in <= #10 data;
end
wire                of_fifo_reset;

//Control Signals
wire                read_enable;

//XXX: WRITE FIFO EMPTY NEEDS TO BE FIXED!!
assign              if_fifo_idle  = (if_write_ready == 3); //write FIFO is completely IDLE
assign              read_enable = sdram_read_enable & write_idle & (if_fifo_idle);

//Read Signals
wire        [1:0]   of_write_ready;
wire        [1:0]   of_write_activate;
wire        [23:0]  of_write_fifo_size;
wire                of_write_strobe;
wire        [31:0]  of_write_data;


//Read FIFO
ppfifo #(
  .DATA_WIDTH(32),
  .ADDRESS_WIDTH(9)
) ppfifo_rd (
  .reset(rst || ~sdram_ready || of_fifo_reset || i_wb_of_reset),

  //Write
  .write_clock(sdram_clk),
  .write_ready(of_write_ready),
  .write_activate(of_write_activate),
  .write_fifo_size(of_write_fifo_size),
  .write_strobe(of_write_strobe),
  .write_data(of_write_data),

  .starved(of_starved),

  //Read
  .read_clock(clk),
  .read_strobe(of_read_strobe),
  .read_ready(of_read_ready),
  .read_activate(of_read_activate),
  .read_count(of_read_count),
  .read_data(of_read_data)
);

//Read Path
sdram_read read_path (
  .rst                      (rst || ~sdram_ready ),
  .clk                      (sdram_clk           ),
  //.debug                    (debug               ),

  //Read Path SDRAM Control
  .command                  (read_command        ),
  .address                  (read_address        ),
  .bank                     (read_bank           ),
  .data_in                  (data_in             ),

  //Control
  .enable                   (read_enable         ),
  .idle                     (read_idle           ),
  .auto_refresh             (refresh             ),
  .wait_for_refresh         (rwfr                ),

  //application address
  .app_address              (app_address         ),

  //Data In Path
  .fifo_reset               (of_fifo_reset       ),
  .fifo_data                (of_write_data       ),
  .fifo_write               (of_write_strobe     ),
  .fifo_ready               (of_write_ready      ),
  .fifo_activate            (of_write_activate   ),
  .fifo_size                (of_write_fifo_size  ),
  .starved                  (of_starved          )
);

//Initialization Write Path
reg   [2:0]   init_command;
reg   [11:0]  init_address;
reg   [1:0]   init_bank;

wire  [2:0]   command;

//Combine all the ras/cas/we
assign command  = ~write_idle ? write_command : ~read_idle ? read_command : init_command;
assign bank =     ~write_idle ? write_bank    : ~read_idle ? read_bank    : init_bank;
assign address  = ~write_idle ? write_address : ~read_idle ? read_address : init_address;

assign ras  = command[2];
assign cas  = command[1];
assign we   = command[0];

//XXX: Disable Data mask for testing
assign data_mask = ~write_idle ? write_data_mask : 2'b00;
//assign data_mask = 2'b00;

//Attach the tristate Data to an in and out
assign        data = writing ? data_out : 16'hZZZZ;


//Write Side of PPFIFO
//assign        debug[1:0]      = of_write_ready;
//assign        debug[3:2]      = of_write_activate;
//assign        debug[4]        = of_write_strobe;
//assign        debug[5]        = of_write_data[31];
//assign        debug[14]       = read_enable;
//assign        debug[15]       = rst || ~sdram_ready || of_fifo_reset || i_wb_of_reset;
//assign        debug[31:16]    = of_write_data[23:8];


//Read side of PPFIFO Read
//assign        debug[0]      = read_enable;
//assign        debug[1]      = of_read_ready;
//assign        debug[2]      = of_read_activate;
//assign        debug[3]      = of_read_data[31];
//assign        debug[4]      = of_read_strobe;
//assign        debug[6]      = rst || ~sdram_ready || of_fifo_reset || i_wb_of_reset;
//assign        debug[22:7]   = of_read_data[23:8];
//assign        debug[23]     = sdram_write_enable;


parameter     START               = 4'h0;
parameter     PRECHARGE           = 4'h1;
parameter     AUTO_REFRESH1       = 4'h2;
parameter     AUTO_REFRESH2       = 4'h3;
parameter     LOAD_MODE_REGISTER  = 4'h4;
parameter     IDLE                = 4'h5;
//parameter     AUTO_REFRESH_PRE    = 4'h6;
parameter     AUTO_REFRESH        = 4'h7;
parameter     AUTO_REFRESH_FIN    = 4'h8;


//auto refresh master timeout
reg   [31:0]  auto_refresh_count;


//General Registers
reg   [3:0]   state;
reg   [15:0]  delay;

always @(posedge sdram_clk) begin

  init_bank                 <=  2'b00;

  if (rst || ~cke) begin
    //either the whole device is in reset or the DCM is not settled
    state                   <=  START;
    delay                   <=  16'h0;
    cs_n                    <=  1;
    init_command            <=  `SDRAM_CMD_NOP;
    init_bank               <=  2'b00;
    init_address            <=  12'h000;
    sdram_ready             <=  0;
    auto_refresh_count      <=  `T_AR_TIMEOUT;
    refresh                 <=  0;

  end
  else begin

    if (delay > 0) begin
      init_command          <=  `SDRAM_CMD_NOP;
      delay                 <=  delay - 1;
    end
    else begin
      case (state)
        START: begin
          //$display ("SDRAM_INIT: START Initialization");
          //wait for the PLL to settle
          delay             <=  `T_PLL;
          state             <=  PRECHARGE;
        end
        PRECHARGE: begin
          //$display ("SDRAM_INIT: PRECHARGE");
          cs_n              <=  0;
          init_command      <=  `SDRAM_CMD_PRE;
          init_address[10]  <=  1;
          delay             <=  `T_RP;
          state             <=  AUTO_REFRESH1;
          init_bank         <=  2'b11;
        end
        AUTO_REFRESH1: begin
          //$display ("SDRAM_INIT: AUTO_REFRESH1");
          init_command      <=  `SDRAM_CMD_AR;
          delay             <=  `T_RFC;
          state             <=  AUTO_REFRESH2;
        end
        AUTO_REFRESH2: begin
          //$display ("SDRAM_INIT: AUTO_REFRESH2");
          init_command      <=  `SDRAM_CMD_AR;
          delay             <=  `T_RFC;
          state             <=  LOAD_MODE_REGISTER;
        end
        LOAD_MODE_REGISTER: begin
          //$display ("SDRAM_INIT: LOAD_MODE_REGISTER");
          init_command      <=  `SDRAM_CMD_MRS;
          delay             <=  `T_MRD;
          init_address      <=  `SDRAM_INIT_LMR;
          state             <=  IDLE;
        end
        IDLE: begin
          sdram_ready       <=  1;
          init_command            <=  `SDRAM_CMD_NOP;
          //waiting for user to initiate a command
          if (refresh && rwfr && wwfr) begin
            //$display ("SDRAM_INIT: Auto Refresh");
            //state           <=  AUTO_REFRESH_PRE;
            state         <=  AUTO_REFRESH;
          end
        end
//        AUTO_REFRESH_PRE: begin
//          init_command    <= `SDRAM_CMD_PRE;
//          init_address[10]<=  1;
//          state           <= AUTO_REFRESH;
//          delay           <= `T_RP;
//        end
        AUTO_REFRESH: begin
          init_command    <= `SDRAM_CMD_AR;
          delay           <=  `T_RFC - 1;
          state           <=  AUTO_REFRESH_FIN;
        end
        AUTO_REFRESH_FIN: begin
          init_command            <=  `SDRAM_CMD_NOP;
          state           <=  IDLE;
          refresh         <=  0;
          auto_refresh_count      <=  `T_AR_TIMEOUT;
        end
        default: begin
          //$display ("Shouldn't be here");
          state <=  START;
        end
      endcase
    end

    //refresh
    if (auto_refresh_count > 0) begin
      auto_refresh_count  <= auto_refresh_count - 1;
    end
    else if (refresh == 0) begin
      refresh             <=  1;
    end
  end
end


endmodule

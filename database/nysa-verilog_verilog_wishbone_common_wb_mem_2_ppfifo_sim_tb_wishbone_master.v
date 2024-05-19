// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

//wishbone master interconnect testbench
/*
Distributed under the MIT licesnse.
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

/* Log
  04/16/2013
    -implement naming convention
  08/30/2012
    -Major overhall of the testbench
    -modfied the way reads and writes happen, now each write requires the
    number of 32-bit data packets even if the user sends only 1
    -there is no more streaming as the data_count will implicity declare
    that a read/write is streaming
    -added the ih_reset which has not been formally defined within the
    system, but will more than likely reset the entire statemachine
  11/12/2011
    -overhauled the design to behave more similar to a real I/O handler
    -changed the timeout to 40 seconds to allow the wishbone master to catch
    nacks
  11/08/2011
    -added interrupt support
*/

`timescale 1 ns/1 ps

`define TIMEOUT_COUNT 40
`define INPUT_FILE "sim/master_input_test_data.txt"
`define OUTPUT_FILE "sim/master_output_test_data.txt"


`define CLK_HALF_PERIOD 10
`define CLK_PERIOD (2 * `CLK_HALF_PERIOD)

`define SLEEP_HALF_CLK #(`CLK_HALF_PERIOD)
`define SLEEP_FULL_CLK #(`CLK_PERIOD)

//Sleep a number of clock cycles
`define SLEEP_CLK(x)  #(x * `CLK_PERIOD)

module wishbone_master_tb (
);

//Virtual Host Interface Signals
reg               clk           = 0;
reg               rst           = 0;
wire              w_master_ready;
reg               r_in_ready      = 0;
reg   [31:0]      r_in_command    = 32'h00000000;
reg   [31:0]      r_in_address    = 32'h00000000;
reg   [31:0]      r_in_data       = 32'h00000000;
reg   [27:0]      r_in_data_count = 0;
reg               r_out_ready     = 0;
wire              w_out_en;
wire  [31:0]      w_out_status;
wire  [31:0]      w_out_address;
wire  [31:0]      w_out_data;
wire  [27:0]      w_out_data_count;
reg               r_ih_reset      = 0;

//wishbone signals
wire              w_wbp_we;
wire              w_wbp_cyc;
wire              w_wbp_stb;
wire [3:0]        w_wbp_sel;
wire [31:0]       w_wbp_adr;
wire [31:0]       w_wbp_dat_o;
wire [31:0]       w_wbp_dat_i;
wire              w_wbp_ack;
wire              w_wbp_int;

//Wishbone master mem bus
wire              w_wbm_we;
wire              w_wbm_cyc;
wire              w_wbm_stb;
wire [3:0]        w_wbm_sel;
wire [31:0]       w_wbm_adr;
wire [31:0]       w_wbm_dat_o;
wire [31:0]       w_wbm_dat_i;
wire              w_wbm_ack;
wire              w_wbm_int;

//Wishbone Slave 0 (DRT) signals
wire              w_wbs0_we;
wire              w_wbs0_cyc;
wire  [31:0]      w_wbs0_dat_o;
wire              w_wbs0_stb;
wire  [3:0]       w_wbs0_sel;
wire              w_wbs0_ack;
wire  [31:0]      w_wbs0_dat_i;
wire  [31:0]      w_wbs0_adr;
wire              w_wbs0_int;

//wishbone slave 1 (Unit Under Test) signals
wire              w_wbs1_we;
wire              w_wbs1_cyc;
wire              w_wbs1_stb;
wire  [3:0]       w_wbs1_sel;
wire              w_wbs1_ack;
wire  [31:0]      w_wbs1_dat_i;
wire  [31:0]      w_wbs1_dat_o;
wire  [31:0]      w_wbs1_adr;
wire              w_wbs1_int;

//wishbone slave 0 signals
wire		          mem0_we_o;
wire		          mem0_cyc_o;
wire  [31:0]	    mem0_dat_o;
wire		          mem0_stb_o;
wire  [3:0]	      mem0_sel_o;
wire		          mem0_ack_i;
wire  [31:0]	    mem0_dat_i;
wire  [31:0]	    mem0_adr_o;
wire		          mem0_int_i;


wire              w_arb0_i_wbs_stb;
wire              w_arb0_i_wbs_cyc;
wire              w_arb0_i_wbs_we;
wire  [3:0]       w_arb0_i_wbs_sel;
wire  [31:0]      w_arb0_i_wbs_dat;
wire  [31:0]      w_arb0_o_wbs_dat;
wire  [31:0]      w_arb0_i_wbs_adr;
wire              w_arb0_o_wbs_ack;
wire              w_arb0_o_wbs_int;




//Local Parameters

localparam        WAIT_FOR_SDRAM      = 8'h00;
localparam        IDLE                = 8'h01;
localparam        SEND_COMMAND        = 8'h02;
localparam        MASTER_READ_COMMAND = 8'h03;
localparam        RESET               = 8'h04;
localparam        PING_RESPONSE       = 8'h05;
localparam        WRITE_DATA          = 8'h06;
localparam        WRITE_RESPONSE      = 8'h07;
localparam        GET_WRITE_DATA      = 8'h08;
localparam        READ_RESPONSE       = 8'h09;
localparam        READ_MORE_DATA      = 8'h0A;
localparam        FINISHED            = 8'h0B;

//Registers/Wires/Simulation Integers
integer           fd_in;
integer           fd_out;
integer           read_count;
integer           timeout_count;
integer           ch;

integer           data_count;

reg [7:0]         state           =   WAIT_FOR_SDRAM;
reg               prev_int        = 0;


reg               execute_command;
reg               command_finished;

reg               request_more_data = 0;
reg               request_more_data_ack;
reg     [27:0]    data_write_count;
reg     [27:0]    data_read_count;

wire              o_sim_mem_stb;
wire              o_sim_mem_cyc;
wire              o_sim_mem_we;
wire  [3:0]       o_sim_mem_sel;
wire  [31:0]      o_sim_mem_dat;
wire  [31:0]      o_sim_mem_adr;
wire  [31:0]      i_sim_mem_dat;
wire              i_sim_mem_ack;
wire              i_sim_mem_int;

//mem slave 0
wire                w_sm0_i_wbs_we;
wire                w_sm0_i_wbs_cyc;
wire  [31:0]        w_sm0_i_wbs_dat;
wire  [31:0]        w_sm0_o_wbs_dat;
wire  [31:0]        w_sm0_i_wbs_adr;
wire                w_sm0_i_wbs_stb;
wire  [3:0]         w_sm0_i_wbs_sel;
wire                w_sm0_o_wbs_ack;
wire                w_sm0_o_wbs_int;

wire                w_mem_we_o;
wire                w_mem_cyc_o;
wire                w_mem_stb_o;
wire  [3:0]         w_mem_sel_o;
wire  [31:0]        w_mem_adr_o;
wire  [31:0]        w_mem_dat_i;
wire  [31:0]        w_mem_dat_o;
wire                w_mem_ack_i;
wire                w_mem_int_i;


reg                 start = 0;
wire  [7:0]         cmd;

//Submodules

wishbone_master wm (
  .clk                 (clk                 ),
  .rst                 (rst                 ),

  .i_ih_rst            (r_ih_reset          ),
  .i_ready             (r_in_ready          ),
  .i_command           (r_in_command        ),
  .i_address           (r_in_address        ),
  .i_data              (r_in_data           ),
  .i_data_count        (r_in_data_count     ),
  .i_out_ready         (r_out_ready         ),
  .o_en                (w_out_en            ),
  .o_status            (w_out_status        ),
  .o_address           (w_out_address       ),
  .o_data              (w_out_data          ),
  .o_data_count        (w_out_data_count    ),
  .o_master_ready      (w_master_ready      ),

  .o_per_we            (w_wbp_we            ),
  .o_per_adr           (w_wbp_adr           ),
  .o_per_dat           (w_wbp_dat_i         ),
  .i_per_dat           (w_wbp_dat_o         ),
  .o_per_stb           (w_wbp_stb           ),
  .o_per_cyc           (w_wbp_cyc           ),
  .o_per_msk           (w_wbp_msk           ),
  .o_per_sel           (w_wbp_sel           ),
  .i_per_ack           (w_wbp_ack           ),
  .i_per_int           (w_wbp_int           ),

  //memory interconnect signals
  .o_mem_we            (w_mem_we_o          ),
  .o_mem_adr           (w_mem_adr_o         ),
  .o_mem_dat           (w_mem_dat_o         ),
  .i_mem_dat           (w_mem_dat_i         ),
  .o_mem_stb           (w_mem_stb_o         ),
  .o_mem_cyc           (w_mem_cyc_o         ),
  .o_mem_msk           (w_mem_msk_o         ),
  .o_mem_sel           (w_mem_sel_o         ),
  .i_mem_ack           (w_mem_ack_i         ),
  .i_mem_int           (w_mem_int_i         )


);

//slave 1
test_wb_mem_2_ppfifo test_m2p (

  .clk                 (clk                 ),
  .rst                 (rst                 ),

  .i_wbs_we            (w_wbs1_we           ),
  .i_wbs_cyc           (w_wbs1_cyc          ),
  .i_wbs_dat           (w_wbs1_dat_i        ),
  .i_wbs_stb           (w_wbs1_stb          ),
  .o_wbs_ack           (w_wbs1_ack          ),
  .o_wbs_dat           (w_wbs1_dat_o        ),
  .i_wbs_adr           (w_wbs1_adr          ),
  .o_wbs_int           (w_wbs1_int          ),

  .o_mem_cyc           (o_sim_mem_cyc       ),
  .o_mem_stb           (o_sim_mem_stb       ),
  .o_mem_we            (o_sim_mem_we        ),
  .i_mem_ack           (i_sim_mem_ack       ),
  .o_mem_sel           (o_sim_mem_sel       ),
  .o_mem_adr           (o_sim_mem_adr       ),
  .o_mem_dat           (o_sim_mem_dat       ),
  .i_mem_dat           (i_sim_mem_dat       ),
  .i_mem_int           (i_sim_i_memnt       )
);

wishbone_interconnect wi (
  .clk                 (clk                 ),
  .rst                 (rst                 ),

  .i_m_we              (w_wbp_we            ),
  .i_m_cyc             (w_wbp_cyc           ),
  .i_m_stb             (w_wbp_stb           ),
  .o_m_ack             (w_wbp_ack           ),
  .i_m_dat             (w_wbp_dat_i         ),
  .o_m_dat             (w_wbp_dat_o         ),
  .i_m_adr             (w_wbp_adr           ),
  .o_m_int             (w_wbp_int           ),

  .o_s0_we             (w_wbs0_we           ),
  .o_s0_cyc            (w_wbs0_cyc          ),
  .o_s0_stb            (w_wbs0_stb          ),
  .i_s0_ack            (w_wbs0_ack          ),
  .o_s0_dat            (w_wbs0_dat_i        ),
  .i_s0_dat            (w_wbs0_dat_o        ),
  .o_s0_adr            (w_wbs0_adr          ),
  .i_s0_int            (w_wbs0_int          ),

  .o_s1_we             (w_wbs1_we           ),
  .o_s1_cyc            (w_wbs1_cyc          ),
  .o_s1_stb            (w_wbs1_stb          ),
  .i_s1_ack            (w_wbs1_ack          ),
  .o_s1_dat            (w_wbs1_dat_i        ),
  .i_s1_dat            (w_wbs1_dat_o        ),
  .o_s1_adr            (w_wbs1_adr          ),
  .i_s1_int            (w_wbs1_int          )
);

wishbone_mem_interconnect wmi (
  .clk                 (clk                 ),
  .rst                 (rst                 ),

  //master
  .i_m_we              (w_mem_we_o          ),
  .i_m_cyc             (w_mem_cyc_o         ),
  .i_m_stb             (w_mem_stb_o         ),
  .i_m_sel             (w_mem_sel_o         ),
  .o_m_ack             (w_mem_ack_i         ),
  .i_m_dat             (w_mem_dat_o         ),
  .o_m_dat             (w_mem_dat_i         ),
  .i_m_adr             (w_mem_adr_o         ),
  .o_m_int             (w_mem_int_i         ),


  //slave 0
  .o_s0_we             (w_sm0_i_wbs_we      ),
  .o_s0_cyc            (w_sm0_i_wbs_cyc     ),
  .o_s0_stb            (w_sm0_i_wbs_stb     ),
  .o_s0_sel            (w_sm0_i_wbs_sel     ),
  .i_s0_ack            (w_sm0_o_wbs_ack     ),
  .o_s0_dat            (w_sm0_i_wbs_dat     ),
  .i_s0_dat            (w_sm0_o_wbs_dat     ),
  .o_s0_adr            (w_sm0_i_wbs_adr     ),
  .i_s0_int            (w_sm0_o_wbs_int     )
);



//mem 0
wb_bram m0 (

  .clk                 (clk                 ),
  .rst                 (rst                 ),

  .i_wbs_cyc           (w_arb0_i_wbs_cyc    ),
  .i_wbs_dat           (w_arb0_i_wbs_dat    ),
  .i_wbs_we            (w_arb0_i_wbs_we     ),
  .i_wbs_stb           (w_arb0_i_wbs_stb    ),
  .i_wbs_sel           (w_arb0_i_wbs_sel    ),
  .i_wbs_adr           (w_arb0_i_wbs_adr    ),
  .o_wbs_dat           (w_arb0_o_wbs_dat    ),
  .o_wbs_ack           (w_arb0_o_wbs_ack    ),
  .o_wbs_int           (w_arb0_o_wbs_int    )
);

arbiter_2_masters arb0 (
  .clk                 (clk                 ),
  .rst                 (rst                 ),

  //masters
  .i_m0_we             (o_sim_mem_we        ),
  .i_m0_stb            (o_sim_mem_stb       ),
  .i_m0_cyc            (o_sim_mem_cyc       ),
  .i_m0_sel            (o_sim_mem_sel       ),
  .i_m0_dat            (o_sim_mem_dat       ),
  .i_m0_adr            (o_sim_mem_adr       ),
  .o_m0_dat            (i_sim_mem_dat       ),
  .o_m0_ack            (i_sim_mem_ack       ),
  .o_m0_int            (i_sim_mem_int       ),


  .i_m1_we             (w_sm0_i_wbs_we      ),
  .i_m1_stb            (w_sm0_i_wbs_stb     ),
  .i_m1_cyc            (w_sm0_i_wbs_cyc     ),
  .i_m1_sel            (w_sm0_i_wbs_sel     ),
  .i_m1_dat            (w_sm0_i_wbs_dat     ),
  .i_m1_adr            (w_sm0_i_wbs_adr     ),
  .o_m1_dat            (w_sm0_o_wbs_dat     ),
  .o_m1_ack            (w_sm0_o_wbs_ack     ),
  .o_m1_int            (w_sm0_o_wbs_int     ),


  //slave
  .o_s_we              (w_arb0_i_wbs_we     ),
  .o_s_stb             (w_arb0_i_wbs_stb    ),
  .o_s_cyc             (w_arb0_i_wbs_cyc    ),
  .o_s_sel             (w_arb0_i_wbs_sel    ),
  .o_s_dat             (w_arb0_i_wbs_dat    ),
  .o_s_adr             (w_arb0_i_wbs_adr    ),
  .i_s_dat             (w_arb0_o_wbs_dat    ),
  .i_s_ack             (w_arb0_o_wbs_ack    ),
  .i_s_int             (w_arb0_o_wbs_int    )
);



assign  w_wbs0_ack   = 0;
assign  w_wbs0_dat_o = 0;





always #`CLK_HALF_PERIOD      clk = ~clk;

initial begin
  fd_out                      = 0;
  read_count                  = 0;
  data_count                  = 0;
  timeout_count               = 0;
  request_more_data_ack       <=  0;
  execute_command             <=  0;

  $dumpfile ("design.vcd");
  $dumpvars (0, wishbone_master_tb);
  fd_in                       = $fopen(`INPUT_FILE, "r");
  fd_out                      = $fopen(`OUTPUT_FILE, "w");
  `SLEEP_HALF_CLK;

  rst                         <= 0;
  `SLEEP_CLK(100);
  rst                         <= 1;

  //clear the handler signals
  r_in_ready                    <= 0;
  r_in_command                  <= 0;
  r_in_address                  <= 32'h0;
  r_in_data                     <= 32'h0;
  r_in_data_count               <= 0;
  r_out_ready                   <= 0;
  //clear wishbone signals
  `SLEEP_CLK(10);
  rst                           <= 0;
  r_out_ready                   <= 1;

  if (fd_in == 0) begin
    $display ("TB: input stimulus file was not found");
  end
  else begin
    //while there is still data to be read from the file
    while (!$feof(fd_in)) begin
      //read in a command
      read_count = $fscanf (fd_in, "%h:%h:%h:%h\n",
                                  r_in_data_count,
                                  r_in_command,
                                  r_in_address,
                                  r_in_data);

      //Handle Frindge commands/comments
      if (read_count != 4) begin
        if (read_count == 0) begin
          ch = $fgetc(fd_in);
          if (ch == "\#") begin
            //$display ("Eat a comment");
            //Eat the line
            while (ch != "\n") begin
              ch = $fgetc(fd_in);
            end
            $display ("");
          end
          else begin
            $display ("Error unrecognized line: %h" % ch);
            //Eat the line
            while (ch != "\n") begin
              ch = $fgetc(fd_in);
            end
          end
        end
        else if (read_count == 1) begin
          $display ("Sleep for %h Clock cycles", r_in_data_count);
          `SLEEP_CLK(r_in_data_count);
          $display ("Sleep Finished");
        end
        else begin
          $display ("Error: read_count = %h != 4", read_count);
          $display ("Character: %h", ch);
        end
      end
      else begin
        case (r_in_command)
          0: $display ("TB: Executing PING commad");
          1: $display ("TB: Executing WRITE command");
          2: $display ("TB: Executing READ command");
          3: $display ("TB: Executing RESET command");
        endcase
        $display ("Execute Command");
        execute_command                 <= 1;
        `SLEEP_CLK(1);
        while (~command_finished) begin
          request_more_data_ack         <= 0;

          if ((r_in_command & 32'h0000FFFF) == 1) begin
            if (request_more_data && ~request_more_data_ack) begin
              read_count      = $fscanf(fd_in, "%h\n", r_in_data);
              $display ("TB: reading a new double word: %h", r_in_data);
              request_more_data_ack     <= 1;
            end
          end

          //so time porgresses wait a tick
          `SLEEP_CLK(1);
          //this doesn't need to be here, but there is a weird behavior in iverilog
          //that wont allow me to put a delay in right before an 'end' statement
          //execute_command <= 1;
        end //while command is not finished
        execute_command <= 0;

        while (command_finished) begin
          $display ("Command Finished");
          `SLEEP_CLK(1);
          execute_command <= 0;
        end
        `SLEEP_CLK(50);
        $display ("TB: finished command");
      end //end read_count == 4
    end //end while ! eof
  end //end not reset
  `SLEEP_CLK(50);
  $fclose (fd_in);
  $fclose (fd_out);
  $finish();
end
//initial begin
//    $monitor("%t, state: %h", $time, state);
//end

//initial begin
//    $monitor("%t, data: %h, state: %h, execute command: %h", $time, w_wbm_dat_o, state, execute_command);
//end
initial begin
    //$monitor("%t, state: %h, execute: %h, cmd_fin: %h", $time, state, execute_command, command_finished);
    //$monitor("%t, state: %h, write_size: %d, write_count: %d, execute: %h", $time, state, r_in_data_count, data_write_count, execute_command);
end



always @ (posedge clk) begin
  if (rst) begin
    state                     <= WAIT_FOR_SDRAM;
    request_more_data         <= 0;
    timeout_count             <= 0;
    prev_int                  <= 0;
    r_ih_reset                <= 0;
    data_write_count          <= 0;
    data_read_count           <= 0;
    start                     <= 1;
    data_read_count           <= 1;

    command_finished          <= 0;
  end
  else begin
    r_ih_reset                <= 0;
    r_in_ready                <= 0;
    r_out_ready               <= 1;
    command_finished          <= 0;
    start                     <= 0;

    //Countdown the NACK timeout
    if (execute_command && timeout_count < `TIMEOUT_COUNT) begin
      timeout_count           <= timeout_count + 1;
    end

    if (execute_command && timeout_count >= `TIMEOUT_COUNT) begin
      case (r_in_command)
        0: $display ("TB: Master timed out while executing PING commad");
        1: $display ("TB: Master timed out while executing WRITE command");
        2: $display ("TB: Master timed out while executing READ command");
        3: $display ("TB: Master timed out while executing RESET command");
      endcase

      command_finished        <= 1;
      state                   <= IDLE;
      timeout_count           <= 0;
    end //end reached the end of a timeout

    case (state)
      WAIT_FOR_SDRAM: begin
        timeout_count         <= 0;
        r_in_ready            <= 0;
        //Uncomment 'start' conditional to wait for SDRAM  to finish starting
        //up
        //if (start) begin
        state                 <=  IDLE;
        //end
      end
      IDLE: begin
        timeout_count         <= 0;
        command_finished      <= 0;
        data_write_count      <= 1;
        if (execute_command && !command_finished) begin
          state               <=  SEND_COMMAND;
        end
        data_read_count       <= 1;
      end
      SEND_COMMAND: begin
        timeout_count         <= 0;
        if (w_master_ready) begin
          r_in_ready          <=  1;
          state               <=  MASTER_READ_COMMAND;
        end
      end
      MASTER_READ_COMMAND: begin
        r_in_ready            <=  1;
        if (!w_master_ready) begin
          r_in_ready          <=  0;
          case (r_in_command & 32'h0000FFFF)
            0: begin
              state             <=  PING_RESPONSE;
            end
            1: begin
              if (r_in_data_count > 1) begin
                $display ("TB:\tWrote Double Word %d: %h", data_write_count, r_in_data);
                if (data_write_count < r_in_data_count) begin
                  state           <=  WRITE_DATA;
                  timeout_count   <=  0;
                  data_write_count<=  data_write_count + 1;
                end
                else begin
                  $display ("TB: Finished Writing: %d 32bit words of %d size", r_in_data_count, data_write_count);
                  state           <=  WRITE_RESPONSE;
                end
              end
              else begin
                $display ("TB:\tWrote Double Word %d: %h", data_write_count, r_in_data);
                $display ("TB: Finished Writing: %d 32bit words of %d size", r_in_data_count, data_write_count);
                state           <=  WRITE_RESPONSE;
              end
            end
            2: begin
              state             <=  READ_RESPONSE;
            end
            3: begin
              state             <=  RESET;
            end
          endcase
        end
      end
      RESET: begin
        r_ih_reset            <=  1;
        state                 <=  RESET;
      end
      PING_RESPONSE: begin
        if (w_out_en) begin
          if (w_out_status[7:0] == 8'hFF) begin
            $display ("TB: Ping Response Good");
          end
          else begin
            $display ("TB: Ping Response Bad (Malformed response: %h)", w_out_status);
          end
          $display ("TB: \tS:A:D = %h:%h:%h\n", w_out_status, w_out_address, w_out_data);
          state               <=  FINISHED;
        end
      end
      WRITE_DATA: begin
        if (!r_in_ready && w_master_ready) begin
          state               <=  GET_WRITE_DATA;
          request_more_data   <=  1;
        end
      end
      WRITE_RESPONSE: begin
        $display ("In Write Response");
        if (w_out_en) begin
          if (w_out_status[7:0] == (~(8'h01))) begin
            $display ("TB: Write Response Good");
          end
          else begin
            $display ("TB: Write Response Bad (Malformed response: %h)", w_out_status);
          end
          $display ("TB: \tS:A:D = %h:%h:%h\n", w_out_status, w_out_address, w_out_data);
          state               <=  FINISHED;
        end
      end
      GET_WRITE_DATA: begin
        if (request_more_data_ack) begin
          request_more_data   <=  0;
          r_in_ready          <=  1;
          state               <=  SEND_COMMAND;
        end
      end
      READ_RESPONSE: begin
        if (w_out_en) begin
          if (w_out_status[7:0] == (~(8'h02))) begin
            $display ("TB: Read Response Good");
            if (w_out_data_count > 0) begin
              if (data_read_count < w_out_data_count) begin
                state           <=  READ_MORE_DATA;
                timeout_count   <=  0;
                data_read_count <=  data_read_count + 1;
              end
              else begin
                state           <=  FINISHED;
              end
            end
          end
          else begin
            $display ("TB: Read Response Bad (Malformed response: %h)", w_out_status);
            state               <=  FINISHED;
          end
          $display ("TB: \tS:A:D = %h:%h:%h\n", w_out_status, w_out_address, w_out_data);
        end
      end
      READ_MORE_DATA: begin
        if (w_out_en) begin
          timeout_count         <=  0;
          r_out_ready           <=  0;
          $display ("TB: Read a 32bit data packet");
          $display ("TB: \tRead Data: %h", w_out_data);
          data_read_count       <=  data_read_count + 1;
        end
        if (data_read_count >= r_in_data_count) begin
          state                 <=  FINISHED;
        end
      end
      FINISHED: begin
        command_finished        <=  1;
        if (!execute_command) begin
          $display ("Execute Command is low");
          command_finished      <=  0;
          state                 <=  IDLE;
        end
      end
    endcase
    if (w_out_en && w_out_status == `PERIPH_INTERRUPT) begin
      $display("TB: Output Handler Recieved interrupt");
      $display("TB:\tcommand: %h", w_out_status);
      $display("TB:\taddress: %h", w_out_address);
      $display("TB:\tdata: %h", w_out_data);
    end
  end//not reset
end



endmodule

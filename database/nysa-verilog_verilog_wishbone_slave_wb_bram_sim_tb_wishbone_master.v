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


`define CLK_HALF_PERIOD 1
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

//Local Parameters

localparam        IDLE            = 4'h0;
localparam        EXECUTE         = 4'h1;
localparam        RESET           = 4'h2;
localparam        PING_RESPONSE   = 4'h3;
localparam        WRITE_DATA      = 4'h4;
localparam        WRITE_RESPONSE  = 4'h5;
localparam        GET_WRITE_DATA  = 4'h6;
localparam        READ_RESPONSE   = 4'h7;
localparam        READ_MORE_DATA  = 4'h8;

//Registers/Wires/Simulation Integers
integer           fd_in;
integer           fd_out;
integer           read_count;
integer           timeout_count;
integer           ch;

integer           data_count;

reg [3:0]         state           =   IDLE;
reg               prev_int        = 0;


reg               execute_command;
reg               command_finished;
reg               request_more_data;
reg               request_more_data_ack;
reg     [27:0]    data_write_count;

//Submodules
wishbone_master wm (
  .clk            (clk              ),
  .rst            (rst              ),

  .i_ih_rst       (r_ih_reset       ),
  .i_ready        (r_in_ready       ),
  .i_command      (r_in_command     ),
  .i_address      (r_in_address     ),
  .i_data         (r_in_data        ),
  .i_data_count   (r_in_data_count  ),
  .i_out_ready    (r_out_ready      ),
  .o_en           (w_out_en         ),
  .o_status       (w_out_status     ),
  .o_address      (w_out_address    ),
  .o_data         (w_out_data       ),
  .o_data_count   (w_out_data_count ),
  .o_master_ready (w_master_ready   ),

  .o_per_we        (w_wbm_we        ),
  .o_per_adr       (w_wbm_adr       ),
  .o_per_dat       (w_wbm_dat_i     ),
  .i_per_dat       (w_wbm_dat_o     ),
  .o_per_stb       (w_wbm_stb       ),
  .o_per_cyc       (w_wbm_cyc       ),
  .o_per_msk       (w_wbm_msk       ),
  .o_per_sel       (w_wbm_sel       ),
  .i_per_ack       (w_wbm_ack       ),
  .i_per_int       (w_wbm_int       )
);

//slave 1
wb_bram s1 (

  .clk        (clk                  ),
  .rst        (rst                  ),

  .i_wbs_we   (w_wbs1_we            ),
  .i_wbs_cyc  (w_wbs1_cyc           ),
  .i_wbs_dat  (w_wbs1_dat_i         ),
  .i_wbs_stb  (w_wbs1_stb           ),
  .o_wbs_ack  (w_wbs1_ack           ),
  .o_wbs_dat  (w_wbs1_dat_o         ),
  .i_wbs_adr  (w_wbs1_adr           ),
  .o_wbs_int  (w_wbs1_int           )
);

wishbone_interconnect wi (
  .clk        (clk                  ),
  .rst        (rst                  ),

  .i_m_we     (w_wbm_we             ),
  .i_m_cyc    (w_wbm_cyc            ),
  .i_m_stb    (w_wbm_stb            ),
  .o_m_ack    (w_wbm_ack            ),
  .i_m_dat    (w_wbm_dat_i          ),
  .o_m_dat    (w_wbm_dat_o          ),
  .i_m_adr    (w_wbm_adr            ),
  .o_m_int    (w_wbm_int            ),

  .o_s0_we    (w_wbs0_we            ),
  .o_s0_cyc   (w_wbs0_cyc           ),
  .o_s0_stb   (w_wbs0_stb           ),
  .i_s0_ack   (w_wbs0_ack           ),
  .o_s0_dat   (w_wbs0_dat_i         ),
  .i_s0_dat   (w_wbs0_dat_o         ),
  .o_s0_adr   (w_wbs0_adr           ),
  .i_s0_int   (w_wbs0_int           ),

  .o_s1_we    (w_wbs1_we            ),
  .o_s1_cyc   (w_wbs1_cyc           ),
  .o_s1_stb   (w_wbs1_stb           ),
  .i_s1_ack   (w_wbs1_ack           ),
  .o_s1_dat   (w_wbs1_dat_i         ),
  .i_s1_dat   (w_wbs1_dat_o         ),
  .o_s1_adr   (w_wbs1_adr           ),
  .i_s1_int   (w_wbs1_int           )
);







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
  `SLEEP_CLK(2);
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
          $display ("");
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
          execute_command <= 1;
        end //while command is not finished
        while (command_finished) begin
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



always @ (posedge clk) begin
  if (rst) begin
    state                     <= IDLE;
    request_more_data         <= 0;
    timeout_count             <= 0;
    prev_int                  <= 0;
    r_ih_reset                <= 0;
    data_write_count          <= 0;
  end
  else begin
    r_ih_reset                <= 0;
    r_in_ready                <= 0;
    r_out_ready               <= 1;
    command_finished          <= 0;

    //Countdown the NACK timeout
    if (execute_command && timeout_count > 0) begin
      timeout_count           <= timeout_count - 1;
    end

    if (execute_command && timeout_count == 0) begin
      case (r_in_command)
        0: $display ("TB: Master timed out while executing PING commad");
        1: $display ("TB: Master timed out while executing WRITE command");
        2: $display ("TB: Master timed out while executing READ command");
        3: $display ("TB: Master timed out while executing RESET command");
      endcase

      state                   <= IDLE;
      command_finished        <= 1;
      timeout_count           <= `TIMEOUT_COUNT;
      data_write_count        <= 1;
    end //end reached the end of a timeout

    case (state)
      IDLE: begin
        if (execute_command & ~command_finished) begin
          $display ("TB: #:C:A:D = %h:%h:%h:%h", r_in_data_count, r_in_command, r_in_address, r_in_data);
          timeout_count       <= `TIMEOUT_COUNT;
          state               <= EXECUTE;
        end
      end
      EXECUTE: begin
        if (w_master_ready) begin
          //send the command over
          r_in_ready            <= 1;
          case (r_in_command & 32'h0000FFFF)
            0: begin
              //ping
              state           <=  PING_RESPONSE;
            end
            1: begin
              //write
              if (r_in_data_count > 1) begin
                $display ("TB: \tWrote double word %d: %h", data_write_count, r_in_data);
                state                   <=  WRITE_DATA;
                timeout_count           <= `TIMEOUT_COUNT;
                data_write_count        <=  data_write_count + 1;
              end
              else begin
                if (data_write_count > 1) begin
                  $display ("TB: \tWrote double word %d: %h", data_write_count, r_in_data);
                end
                state                   <=  WRITE_RESPONSE;
              end
            end
            2: begin
              //read
              state           <=  READ_RESPONSE;
            end
            3: begin
              //reset
              state           <=  RESET;
            end
          endcase
        end
      end
      RESET: begin
        //reset the system
        r_ih_reset                    <=  1;
        command_finished            <=  1;
        state                       <=  IDLE;
      end
      PING_RESPONSE: begin
        if (w_out_en) begin
          if (w_out_status == (~(32'h00000000))) begin
            $display ("TB: Read a successful ping reponse");
          end
          else begin
            $display ("TB: Ping response is incorrect!");
          end
          $display ("TB: \tS:A:D = %h:%h:%h\n", w_out_status, w_out_address, w_out_data);
          command_finished  <= 1;
          state                     <=  IDLE;
        end
      end
      WRITE_DATA: begin
        if (!r_in_ready && w_master_ready) begin
          state                     <=  GET_WRITE_DATA;
          request_more_data         <=  1;
        end
      end
      WRITE_RESPONSE: begin
        if (w_out_en) begin
         if (w_out_status == (~(32'h00000001))) begin
            $display ("TB: Read a successful write reponse");
          end
          else begin
            $display ("TB: Write response is incorrect!");
          end
          $display ("TB: \tS:A:D = %h:%h:%h\n", w_out_status, w_out_address, w_out_data);
          state                   <=  IDLE;
          command_finished  <= 1;
        end
      end
      GET_WRITE_DATA: begin
        if (request_more_data_ack) begin
//XXX: should request more data be a strobe?
          request_more_data   <=  0;
          r_in_ready            <=  1;
          r_in_data_count       <=  r_in_data_count -1;
          state               <=  EXECUTE;
        end
      end
      READ_RESPONSE: begin
        if (w_out_en) begin
          if (w_out_status == (~(32'h00000002))) begin
            $display ("TB: Read a successful read response");
            if (w_out_data_count > 0) begin
              state             <=  READ_MORE_DATA;
              //reset the NACK timeout
              timeout_count     <=  `TIMEOUT_COUNT;
            end
            else begin
              state             <=  IDLE;
              command_finished  <= 1;
            end
          end
          else begin
            $display ("TB: Read response is incorrect");
            command_finished  <= 1;
          end
          $display ("TB: \tS:A:D = %h:%h:%h\n", w_out_status, w_out_address, w_out_data);
        end
      end
      READ_MORE_DATA: begin
        if (w_out_en) begin
          r_out_ready             <=  0;
          if (w_out_status == (~(32'h00000002))) begin
            $display ("TB: Read a 32bit data packet");
            $display ("Tb: \tRead Data: %h", w_out_data);
          end
          else begin
            $display ("TB: Read reponse is incorrect");
          end

          //read the output data count to determine if there is more data
          if (w_out_data_count == 0) begin
            state             <=  IDLE;
            command_finished  <=  1;
          end
        end
      end
      default: begin
        $display ("TB: state is wrong");
        state <= IDLE;
      end //somethine wrong here
    endcase //state machine
    if (w_out_en && w_out_status == `PERIPH_INTERRUPT) begin
      $display("TB: Output Handler Recieved interrupt");
      $display("TB:\tcommand: %h", w_out_status);
      $display("TB:\taddress: %h", w_out_address);
      $display("TB:\tdata: %h", w_out_data);
    end
  end//not reset
end

endmodule

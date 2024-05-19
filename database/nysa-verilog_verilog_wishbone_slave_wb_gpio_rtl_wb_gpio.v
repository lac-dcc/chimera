// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

//wb_gpio.v
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

/*
  Self Defining Bus (SDB)

  Set the Vendor ID (Hexidecimal 64-bit Number)
  SDB_VENDOR_ID:0x800000000000C594

  Set the Device ID (Hexcidecimal 32-bit Number)
  SDB_DEVICE_ID:0x00000002

  Set the version of the Core XX.XXX.XXX Example: 01.000.000
  SDB_CORE_VERSION:00.000.001

  Set the Device Name: (19 UNICODE characters)
  SDB_NAME:wb_gpio

  Set the class of the device (16 bits) Set as 0
  SDB_ABI_CLASS:0

  Set the ABI Major Version: (8-bits)
  SDB_ABI_VERSION_MAJOR:0x02

  Set the ABI Minor Version (8-bits)
  SDB_ABI_VERSION_MINOR:0x01

  Set the Module URL (63 Unicode Characters)
  SDB_MODULE_URL:http://www.cospandesign.com

  Set the date of module YYYY/MM/DD
  SDB_DATE:2015/01/07

  Device is executable (True/False)
  SDB_EXECUTABLE:True

  Device is readable (True/False)
  SDB_READABLE:True

  Device is writeable (True/False)
  SDB_WRITEABLE:True

  Device Size: Number of Registers
  SDB_SIZE:8

  USER_PARAMETER: DEFAULT_INTERRUPT_MASK
  USER_PARAMETER: DEFAULT_INTERRUPT_EDGE
  USER_PARAMETER: DEFAULT_INTERRUPT_BOTH_EDGE
  USER_PARAMETER: DEFAULT_INTERRUPT_TIMEOUT
*/

`include "project_defines.v"

module wb_gpio#(
  parameter DEFAULT_INTERRUPT_MASK      = 0,
  parameter DEFAULT_INTERRUPT_EDGE      = 0,
  parameter DEFAULT_INTERRUPT_BOTH_EDGE = 0,
  parameter DEFAULT_INTERRUPT_TIMEOUT   = 0

  )(
  input               clk,
  input               rst,

  //output      [31:0]  debug,
  //Add signals to control your device here

  //Wishbone Bus Signals
  input               i_wbs_we,
  input               i_wbs_cyc,
  input       [3:0]   i_wbs_sel,
  input       [31:0]  i_wbs_dat,
  input               i_wbs_stb,
  output  reg         o_wbs_ack,
  output  reg [31:0]  o_wbs_dat,
  input       [31:0]  i_wbs_adr,

  //This interrupt can be controlled from this module or a submodule
  output  reg         o_wbs_int,

  output  reg [31:0]  gpio_out,
  input       [31:0]  gpio_in

);

localparam      GPIO                  = 32'h00000000;
localparam      GPIO_OUTPUT_ENABLE    = 32'h00000001;
localparam      INTERRUPTS            = 32'h00000002;
localparam      INTERRUPT_ENABLE      = 32'h00000003;
localparam      INTERRUPT_EDGE        = 32'h00000004;
localparam      INTERRUPT_BOTH_EDGE   = 32'h00000005;
localparam      INTERRUPT_TIMEOUT     = 32'h00000006;
localparam      READ_CLOCK_RATE       = 32'h00000007;

//gpio registers
reg     [31:0]  gpio_direction;
wire    [31:0]  gpio;

//interrupt registers
reg     [31:0]  interrupts;
reg     [31:0]  interrupt_enable;
reg     [31:0]  interrupt_edge;
reg     [31:0]  interrupt_both_edge;
reg     [31:0]  interrupt_timeout_count;
reg     [31:0]  interrupt_count;
reg             clear_interrupts;


genvar i;
generate
  for (i = 0; i < 32; i = i + 1) begin : tsbuf
    assign gpio[i] = gpio_direction[i] ? gpio_out[i] : gpio_in[i];
  end
endgenerate

//blocks
always @ (posedge clk) begin
  if (rst) begin
    o_wbs_dat               <= 32'h00000000;
    o_wbs_ack               <= 0;

    //reset gpio's
    gpio_out                <= 32'h00000000;
    gpio_direction          <= 32'h00000000;

    //reset interrupts
    interrupt_enable        <= DEFAULT_INTERRUPT_MASK;
    interrupt_edge          <= DEFAULT_INTERRUPT_EDGE;
    interrupt_both_edge     <= DEFAULT_INTERRUPT_BOTH_EDGE;
    interrupt_timeout_count <= DEFAULT_INTERRUPT_TIMEOUT;
    clear_interrupts        <= 0;
  end
  else begin
    clear_interrupts        <= 0;
    //when the master acks our ack, then put our ack down
    if (o_wbs_ack & ~ i_wbs_stb)begin
      o_wbs_ack <= 0;
    end

    if (i_wbs_stb & i_wbs_cyc) begin
      //master is requesting somethign
      if (!o_wbs_ack) begin
        if (i_wbs_we) begin
          //write request
          case (i_wbs_adr)
            GPIO: begin
              $display("user wrote %h", i_wbs_dat);
              gpio_out                              <= i_wbs_dat & gpio_direction;
            end
            GPIO_OUTPUT_ENABLE: begin
              $display("%h ->gpio_direction", i_wbs_dat);
              gpio_direction                  <= i_wbs_dat;
            end
            INTERRUPTS: begin
              $display("trying to write %h to interrupts?!", i_wbs_dat);
              //can't write to the interrupt
            end
            INTERRUPT_ENABLE: begin
              $display("%h -> interrupt enable", i_wbs_dat);
              interrupt_enable                    <= i_wbs_dat;
              clear_interrupts              <=  1;
            end
            INTERRUPT_EDGE: begin
              $display("%h -> interrupt_edge", i_wbs_dat);
              interrupt_edge                <= i_wbs_dat;
              clear_interrupts              <=  1;
            end
            INTERRUPT_BOTH_EDGE: begin
              $display("%h -> interrupt_both_edge", i_wbs_dat);
              interrupt_both_edge           <= i_wbs_dat;
              clear_interrupts              <=  1;
            end
            INTERRUPT_TIMEOUT: begin
              interrupt_timeout_count       <=  i_wbs_dat;
            end
            default: begin
            end
          endcase
        end
        else begin
          if (!o_wbs_ack) begin //Fix double reads
            //read request
            case (i_wbs_adr)
              GPIO: begin
                $display("user read %h", i_wbs_adr);
                o_wbs_dat           <= gpio;
                clear_interrupts    <= 1;
              end
              GPIO_OUTPUT_ENABLE: begin
                $display("user read %h", i_wbs_adr);
                o_wbs_dat           <= gpio_direction;
              end
              INTERRUPTS: begin
                $display("user read %h", i_wbs_adr);
                o_wbs_dat           <= interrupts;
                clear_interrupts    <= 1;
              end
              INTERRUPT_ENABLE: begin
                $display("user read %h", i_wbs_adr);
                o_wbs_dat           <= interrupt_enable;
              end
              INTERRUPT_EDGE: begin
                $display("user read %h", i_wbs_adr);
                o_wbs_dat           <= interrupt_edge;
              end
              INTERRUPT_BOTH_EDGE: begin
                $display("user read %h", i_wbs_adr);
                o_wbs_dat           <= interrupt_both_edge;
              end
              INTERRUPT_TIMEOUT: begin
                o_wbs_dat           <= interrupt_timeout_count;
              end
              READ_CLOCK_RATE: begin
                o_wbs_dat           <= `CLOCK_RATE;
              end
              default: begin
                o_wbs_dat           <= 32'h00;
              end
            endcase
          end
        end
        o_wbs_ack <= 1;
      end
    end
  end
end

//interrupts
reg     [31:0]  prev_gpio_in;

//this is the change
wire [31:0] pos_gpio_edge;
wire [31:0] neg_gpio_edge;
assign neg_gpio_edge = ((~interrupt_edge | interrupt_both_edge) & (interrupt_enable & ( prev_gpio_in & ~gpio_in)));
assign pos_gpio_edge = (( interrupt_edge | interrupt_both_edge) & (interrupt_enable & (~prev_gpio_in &  gpio_in)));

/*
initial begin
  $monitor ("%t, interrupts: %h, mask: %h, edge: %h, gpio_edge: %h", $time, interrupts, interrupt_enable, interrupt_edge, gpio_edge);
end
*/

/*
assign  debug[0]  = gpio[2];
assign  debug[1]  = gpio[3];

assign  debug[2]  = interrupt_enable[2];
assign  debug[3]  = interrupt_enable[3];

assign  debug[4]  = interrupt_edge[2];
assign  debug[5]  = interrupt_edge[3];

assign  debug[6]  = prev_gpio_in[2];
assign  debug[7]  = prev_gpio_in[3];

assign  debug[8]  = pos_gpio_edge[2];
assign  debug[9]  = pos_gpio_edge[3];

assign  debug[10] = neg_gpio_edge[2];
assign  debug[11] = neg_gpio_edge[3];

assign  debug[12] = interrupts[2];
assign  debug[13] = interrupts[3];

assign  debug[14] = clear_interrupts;
*/


always @ (posedge clk) begin
  if (rst) begin
    interrupt_count   <= 0;
    interrupts        <= 32'h00000000;
    o_wbs_int         <= 0;
  end
  else begin

    //user requests to clear the interrupts
    if (clear_interrupts) begin
      interrupts    <= 32'h00000000;
    end
    if ((pos_gpio_edge > 0) || (neg_gpio_edge > 0)) begin
      //check to see if there was a negative or postive edge that occured
        interrupts    <= (pos_gpio_edge | neg_gpio_edge);
        $display ("found an interrupt in the slave");
      end


      //Implement timeout behavior
      if (interrupts == 0) begin
        interrupt_count <=  0;
      end

      if ((interrupts > 0) && (interrupt_timeout_count > 0)) begin
        if (interrupt_count < interrupt_timeout_count) begin
          interrupt_count     <= interrupt_count + 1;
        end
        else begin
          interrupts          <= 32'h00000000;
          interrupt_count     <=  0;
        end
      end

      //Set the wishbone interrupt pin on this module
      if (interrupts > 0) begin
        o_wbs_int           <= 1;
      end
      else begin
        o_wbs_int           <= 0;
      end
      prev_gpio_in            <= gpio_in;
    end
  end

endmodule

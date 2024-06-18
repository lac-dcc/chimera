// This program was cloned from: https://github.com/cornell-c2s2/march24_tapein
// License: Apache License 2.0

/*
==========================================================================
master.v
==========================================================================
SPIMaster module for sending messages over SPI.
Supports SPI mode 0.

Author : Kyle Infantino
  Date : April 26, 2022

*/

/*
Note for C2S2 future development:
We can add support for different frequencies. Currently, SPI Master
runs at 1/2 of the system clock. However, we can add cycles to lower the
frequency. We will need a modified FSM and input from chip so that we 
can dynamically lower or raise the SPI frequency.
*/

/*
Notes 3/11/2023
Adding an extra state that will serve to divide frequency. Using a 
variable called freq_div_count, we will check if we need to add 
additional cycles to make the system 1/2 slower (keep in mind that the 
SPI Master is alread 1/2 of the master system clock). freq_div_count 
will obtain its value from a configuration register that is outside the 
SPI Master files. 

-Austin
*/

/*
Notes 3/12/2023
We need to consider when the FSM enters CS_LOW_WAIT. Because we are 
following the set frequency, there is the need for the CS_LOW_HOLD 
state to assess if it needs to go to the CS_LOW_WAIT state.

I added some logic to allow for frequency counter to be refilled
after countdown complete. Will refill value after the 

-Austin
*/

/*
Notes 3/20/2023
I failed to account for the fact that the divisor of the frequency
should be squared. What was happening was that the counter for the 
hold states will only run for the number stored in freq. Therefore, 
256 cycles actually turns out to be 7.

There was also an issue with the shift registers. Our design with
the hold states affected the posedge and negedge of the clock.
However, this would cause the registers to shift data during our
hold states. The hold states no longer have an impact on posedge
or negedge.

Negedge and posedge may need own states.

In the next version of SPI Master, we can include support for SPI
modes 1-3. This will require that we add additional states for each
mode. This will also require that the sclk_posedge and sclk_negedge
are changed to be more general controls such as shift_in_enable
and shift_out_enable.
-Austin
*/

/*
Notes 3/20/2023
This week, I have made some bug adjustments. First I fixed the new 
state machine to accurately depict when positive and negative clock
edges are on.

Currently, there is an issue with the number of hold cycles being
run. When running the desired number of cycles, we get an erroneous
number. Right now, if 7 was written then 8 hold cycles run instead
of 127.
-Austin
*/

`ifndef SPI_MASTER
`define SPI_MASTER

`include "regs/shift/bitwise.v"
`include "cmn/regs.v"

module spi_Master #(
  parameter int nbits = 34,
  parameter int ncs = 1,
  parameter int logBitsN = $clog2(nbits) + 1,
  parameter int logCSN = ncs > 1 ? $clog2(ncs) : 1
) (
  input logic clk,
  input logic reset,

  output logic spi_ifc_cs  [ncs],
  input  logic spi_ifc_miso,
  output logic spi_ifc_mosi,
  output logic spi_ifc_sclk,

  input  logic             recv_val,
  output logic             recv_rdy,
  input  logic [nbits-1:0] recv_msg,

  output logic             send_val,
  input  logic             send_rdy,
  output logic [nbits-1:0] send_msg,

  // Val/Rdy interface allowing us to change the packet size
  input  logic                packet_size_ifc_val,
  output logic                packet_size_ifc_rdy,
  input  logic [logBitsN-1:0] packet_size_ifc_msg,

  // Val/Rdy interface allowing us to change the chip select address
  input  logic              cs_addr_ifc_val,
  output logic              cs_addr_ifc_rdy,
  input  logic [logCSN-1:0] cs_addr_ifc_msg,

  input  logic       freq_ifc_val,  //new 
  output logic       freq_ifc_rdy,  //new 
  input  logic [2:0] freq_ifc_msg   //new
);

  logic [logBitsN-1:0] packet_size_reg_out;
  logic                packet_size_reg_en;
  logic [  logCSN-1:0] cs_addr_reg_out;
  logic                cs_addr_reg_en;
  logic [logBitsN-1:0] sclk_counter;
  logic                sclk_counter_en;
  logic [         6:0] freq_high_counter;  //new
  logic                freq_high_counter_en;  //new
  logic [         6:0] freq_low_counter;  //new
  logic                freq_low_counter_en;  //new
  logic [         2:0] freq_reg_out;  //new
  logic                freq_reg_en;  //new
  logic [   nbits-1:0] shreg_in_out;
  logic [   nbits-1:0] shreg_out_out;
  logic                freq_high_refill;
  logic                freq_low_refill;

  cmn_EnResetReg #(logBitsN) packet_size_reg (
    .clk(clk),
    .reset(reset),
    .q(packet_size_reg_out),
    .d(packet_size_ifc_msg),
    .en(packet_size_reg_en)
  );

  cmn_EnResetReg #(logCSN) cs_addr_reg (
    .clk(clk),
    .reset(reset),
    .q(cs_addr_reg_out),
    .d(cs_addr_ifc_msg),
    .en(cs_addr_reg_en)
  );

  cmn_EnResetReg #(3) freq_reg (
    .clk(clk),
    .reset(reset),
    .q(freq_reg_out),
    .d(freq_ifc_msg),
    .en(freq_reg_en)
  );

  assign packet_size_ifc_rdy = recv_rdy;
  assign cs_addr_ifc_rdy = recv_rdy;
  assign freq_ifc_rdy = recv_rdy;  //new

  logic sclk_negedge;
  logic sclk_posedge;
  logic shreg_out_rst;

  typedef enum logic [3:0] {
    STATE_INIT,
    STATE_START0,
    STATE_START1,
    STATE_SCLK_HIGH,
    STATE_SCLK_LOW,
    STATE_SCLK_HIGH_HOLD,
    STATE_SCLK_LOW_HOLD,
    STATE_CS_LOW_WAIT,
    STATE_DONE
  } state_t;

  state_t state, next_state;

  //state transition logic
  always_ff @(posedge clk) begin : up_state
    if (reset) state <= STATE_INIT;
    else state <= next_state;
  end

  //next state logic
  always_comb begin : up_stateChange
    case (state)
      STATE_INIT: next_state = (recv_val) ? STATE_START0 : STATE_INIT;
      STATE_START0: next_state = STATE_START1;
      STATE_START1: next_state = STATE_SCLK_HIGH;
      STATE_SCLK_HIGH:
      if (freq_high_counter == 0) next_state = STATE_SCLK_LOW;
      else next_state = STATE_SCLK_HIGH_HOLD;
      STATE_SCLK_LOW:
      if (freq_low_counter == 0) begin
        next_state = (sclk_counter == 0) ? STATE_CS_LOW_WAIT : STATE_SCLK_HIGH;
      end else next_state = STATE_SCLK_LOW_HOLD;
      STATE_SCLK_HIGH_HOLD:  //new
      if (freq_high_counter == 0) next_state = STATE_SCLK_LOW;
      else next_state = STATE_SCLK_HIGH_HOLD;
      STATE_SCLK_LOW_HOLD:  //new
      if (freq_low_counter == 0) begin
        next_state = (sclk_counter == 0) ? STATE_CS_LOW_WAIT : STATE_SCLK_HIGH;
      end else next_state = STATE_SCLK_LOW_HOLD;
      STATE_CS_LOW_WAIT: next_state = STATE_DONE;
      STATE_DONE: begin
        if (recv_val) next_state = STATE_START0;
        else if (send_rdy) next_state = STATE_INIT;
        else next_state = STATE_DONE;
      end
      default: next_state = STATE_INIT;
    endcase
  end

  // state outputs
  always_comb begin : up_stateOutputs
    recv_rdy = 0;
    send_val = 0;
    spi_ifc_sclk = 0;
    packet_size_reg_en = 0;
    cs_addr_reg_en = 0;
    /* svlint off loop_statement_in_always_comb */
    for (integer i = 0; i < ncs; i++) begin
      spi_ifc_cs[i] = 1;
    end
    /* svlint on loop_statement_in_always_comb */
    sclk_negedge = 0;
    sclk_posedge = 0;
    sclk_counter_en = 0;
    shreg_out_rst = 0;
    freq_high_refill = 0;
    freq_low_refill = 0;
    freq_high_counter_en = 0;
    freq_low_counter_en = 0;


    if (state == STATE_INIT) begin
      recv_rdy           = 1;
      packet_size_reg_en = packet_size_ifc_val;
      cs_addr_reg_en     = cs_addr_ifc_val;
      freq_reg_en        = freq_ifc_val;
    end else if (state == STATE_START0) begin
      spi_ifc_cs[cs_addr_reg_out] = 0;
      shreg_out_rst               = 1;
    end else if (state == STATE_START1) begin
      sclk_posedge                = 1;
      spi_ifc_cs[cs_addr_reg_out] = 0;
    end else if (state == STATE_SCLK_HIGH) begin
      spi_ifc_cs[cs_addr_reg_out] = 0;
      spi_ifc_sclk                = 1;
      sclk_negedge                = (freq_high_counter == 0);
      sclk_counter_en             = 1;
      freq_high_counter_en        = 1;
      freq_low_refill             = 1;
    end else if (state == STATE_SCLK_LOW) begin
      sclk_posedge                = ((sclk_counter != 0) && (freq_low_counter == 0));
      spi_ifc_cs[cs_addr_reg_out] = 0;
      spi_ifc_sclk                = 0;
      freq_low_counter_en         = 1;
      freq_high_refill            = 1;
    end else if (state == STATE_SCLK_HIGH_HOLD) begin
      spi_ifc_cs[cs_addr_reg_out] = 0;
      spi_ifc_sclk                = 1;
      sclk_negedge                = (freq_high_counter == 0);
      sclk_counter_en             = 0;
      freq_high_counter_en        = 1;
    end else if (state == STATE_SCLK_LOW_HOLD) begin
      sclk_posedge                = ((sclk_counter != 0) && (freq_low_counter == 0));
      spi_ifc_cs[cs_addr_reg_out] = 0;
      spi_ifc_sclk                = 0;
      freq_low_counter_en         = 1;
    end else if (state == STATE_CS_LOW_WAIT) begin
      spi_ifc_cs[cs_addr_reg_out] = 0;
    end else if (state == STATE_DONE) begin
      recv_rdy           = 1;
      send_val           = 1;
      packet_size_reg_en = packet_size_ifc_val;
      cs_addr_reg_en     = cs_addr_ifc_val;
      freq_reg_en        = freq_ifc_val;
    end else begin
    end
  end

  //sclk counter logic
  always_ff @(posedge clk) begin
    if (reset) sclk_counter <= 0;
    else if (recv_val & recv_rdy) sclk_counter <= packet_size_reg_out;
    else if (sclk_counter_en) sclk_counter <= sclk_counter - 1;
    else sclk_counter <= sclk_counter;
  end

  //freq positive counter logic
  always_ff @(posedge clk) begin
    if (reset) freq_high_counter <= 0;
    else if ((recv_val & recv_rdy) | freq_high_refill) begin
      freq_high_counter <= 2 ** freq_reg_out - 1;
    end else if (freq_high_counter_en) freq_high_counter <= freq_high_counter - 1;
    else freq_high_counter <= freq_high_counter;
  end

  //freq negative counter logic
  always_ff @(posedge clk) begin
    if (reset) freq_low_counter <= 0;
    else if ((recv_val & recv_rdy) | freq_low_refill) begin
      freq_low_counter <= 2 ** freq_reg_out - 1;
    end else if (freq_low_counter_en) freq_low_counter <= freq_low_counter - 1;
    else freq_low_counter <= freq_low_counter;
  end

  //Datapath
  regs_shift_Bitwise #(nbits, 1'b0) shreg_in (
    .clk(clk),
    .reset(shreg_out_rst),
    .d(spi_ifc_miso),
    .en(sclk_posedge),
    .load(0),
    .load_en(0),
    .q(shreg_in_out)
  );

  regs_shift_Bitwise #(nbits, 1'b0) shreg_out (
    .clk(clk),
    .reset(reset),
    .d(0),
    .en(sclk_negedge),
    .load(recv_msg << (nbits[logBitsN-1:0] - packet_size_reg_out)),  // put message into most significant bits
    .load_en(recv_rdy & recv_val),
    .q(shreg_out_out)
  );

  assign spi_ifc_mosi = shreg_out_out[nbits-1];
  assign send_msg = shreg_in_out;

endmodule

`endif  /*SPI_V3_COMPONENTS_SPIMASTER_V*/

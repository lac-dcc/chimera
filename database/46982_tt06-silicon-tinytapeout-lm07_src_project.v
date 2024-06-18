// This program was cloned from: https://github.com/silicon-efabless/tt06-silicon-tinytapeout-lm07
// License: Apache License 2.0

//--------------------Tiny Tapeout template Donot touch it--------------------
/*
 * Copyright (c) 2024 Silicon University, Bhubaneswar, India
 * SPDX-License-Identifier: Apache-2.0
 */
// Code your design here
//`timescale 1ns / 1ps
//DEFINES
`define RST_COUNT       5'd0
`define CS_LOW_COUNT    5'd4
`define CS_HIGH_COUNT   5'd20
`define SPI_LATCH_COUNT 5'd22
`define MAX_COUNT       5'd28
//
`define SPI_IDLE	2'b00
`define SPI_READ	2'b01
`define SPI_LATCH	2'b10
//
`define DISP_CORF	2'b00
`define DISP_LSB	2'b01
`define DISP_MSB	2'b10

`define default_netname none

// DO NOT CHANGE THIS MODULE
module tt_um_silicon_tinytapeout_lm07 (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.
  //assign uo_out  = ui_in + uio_in;  // Example: ou_out is the sum of ui_in and uio_in
  // DOUBLE CHECK THIS. The enables may not be auto checked. 
  assign uio_oe  = 8'b00111011;
  assign uio_out[7:6] = 2'b00;
  assign uio_out[2] = 1'b0;
//-------------------------------------------------------------------------------------

//--------------Declaration of intenal signal to ports--------------
  
    //Internal signal-to-port assignment
  assign sel_ext_seg = ui_in[0];        //DIP switch-1: 0-> demo brd 1 7-seg, 1-> ext 2 7-seg
  assign sel_ob_LSB  = ui_in[1];       //DIP switch-2: if ui_in[0]=0: 1-> LSB, 0-> MSB
  assign sel_CorF = ui_in[2];		  //DIP switch-3: 0-> Centigrade: 1-> Farahneight
  
    // 7-segment display output
  assign uo_out[0] = dataSeg[0];       //7-seg A
  assign uo_out[1] = dataSeg[1];        //7-seg B
  assign uo_out[2] = dataSeg[2];        //7-seg C
  assign uo_out[3] = dataSeg[3];        //7-seg D
  assign uo_out[4] = dataSeg[4];        //7-seg E
  assign uo_out[5] = dataSeg[5];        //7-seg F
  assign uo_out[6] = dataSeg[6];        //7-seg G
  assign uo_out[7] = dataSeg[7];        //7-seg DP
  

    // SPI signals
  assign uio_out[0] = CS;              //CS-->chip select for LM70
  assign uio_out[1] = SCK;             //SCK--> clock for LM70
  assign SIO = uio_in[2];              //SDI/MISO Data input
  assign uio_out[3] = sel_ext[0];      //C/F
  assign uio_out[4] = sel_ext[1];      //LSB
  assign uio_out[5] = sel_ext[2];      //MSB

  wire SIO;
  wire CS;
  reg SCK;
  reg [7:0] dataSeg;
  wire sel_CorF;

  reg [7:0] shift_reg;
  reg [7:0] tempC_bin_latch;
  wire [7:0] tempF;
  wire [7:0] tempCorF;
  reg [1:0] spi_state;
  reg [4:0] count;

  wire [3:0] bcd_msb;
  wire [3:0] bcd_lsb;
  wire bcd_lsb_carry;
  wire [3:0] bcd_out;
  wire [3:0] bcd_data;
  wire [3:0] bcd_CorF;
  wire data_state;
  wire data_sel;
  
  wire [2:0] sel_ext;       //sel_ext[0]->CorF, [1]->LSB, [2]->MSB

  wire sel_ext_seg;         // assigned to ui[0]:'1':use external 7-seg '0':demoboard 7 segment
  wire sel_ob_LSB;          // assigned to ui[1]:'1': display LSB on the demoboard 7-seg
  reg lsb_sel;
  wire lsb_state;

  // Code below is immplementation of 2-stage MUXes to select LSB/MSB and C/F
  assign data_state = (dispState == `DISP_LSB) || (dispState == `DISP_MSB);
  assign data_sel = ~sel_ext_seg || data_state;
  //
  assign lsb_state = (dispState == `DISP_LSB);
  //
  always @(*) begin
    case({sel_ext_seg, sel_ob_LSB, lsb_state}) 
      3'b000: lsb_sel = 1'b0;
      3'b001: lsb_sel = 1'b0;
      3'b010: lsb_sel = 1'b1;
      3'b011: lsb_sel = 1'b1;
      3'b100: lsb_sel = 1'b0;
      3'b110: lsb_sel = 1'b0;
      3'b101: lsb_sel = 1'b1;
      3'b111: lsb_sel = 1'b1;
      default: lsb_sel = 1'b0;
    endcase
  end
      
  assign bcd_data = lsb_sel ? bcd_lsb : bcd_msb + bcd_lsb_carry;
  assign bcd_CorF = sel_CorF ? 4'b0001 : 4'b0000; //0-> C , 1-> F 
  assign bcd_out = data_sel ? bcd_data : bcd_CorF;

  //--------------------------------------------------------------------------
  // BCD ot 7-segment converter
  // After deciamal '9', it wraps to '0' again with a carryover to MSB
  always @(*) begin//represents combinational logic
    case ({data_sel,bcd_out})
	//Temperature Display
        5'b10000: dataSeg = 8'b00111111; //0 0x3F
        5'b10001: dataSeg = 8'b00000110; //1 0x06
        5'b10010: dataSeg = 8'b01011011; //2 0x5B	
        5'b10011: dataSeg = 8'b01001111; //3 0x4F
        5'b10100: dataSeg = 8'b01100110; //4 0x66
        5'b10101: dataSeg = 8'b01101101; //5 0x6D
        5'b10110: dataSeg = 8'b01111101; //6 0x7D
        5'b10111: dataSeg = 8'b00000111; //7 0x07
        5'b11000: dataSeg = 8'b01111111; //8 0x7F
        5'b11001: dataSeg = 8'b01101111; //9 0x6F
        5'b11010: dataSeg = 8'b00111111; //0
        5'b11011: dataSeg = 8'b00000110; //1
        5'b11100: dataSeg = 8'b01011011; //2
        5'b11101: dataSeg = 8'b01001111; //3
        5'b11110: dataSeg = 8'b01100110; //4 
        5'b11111: dataSeg = 8'b01101101; //5
	//Centigrade or Farahneit 
        5'b00000: dataSeg = 8'b00111001;	//C 0x39 
        5'b00001: dataSeg = 8'b01110001;	//F 0x71 
	//
        default:  dataSeg = 8'b00000110; // 0x06 Default case to avoid latches
    endcase
end
  
  // Course C-to-F conversion
  // temp(F) = 2*C + 32  (Accurate: 9*C/5 +32)
  // Error % is 0.62% at 0C and 9.43% at 100C
  assign tempF = (tempC_bin_latch<<1) + 6'h20;
  //MUX: Select C or F
  assign tempCorF = sel_CorF ? tempF : tempC_bin_latch;

  //BCD Logic
  //Temp/10 approx. 1/16 + 1/32
  assign bcd_msb = (tempCorF + (tempCorF>>1))>>4;
  //LSB = temp - 10*MSB = temp - (8*MSB + 2*MSB)
  assign bcd_lsb = tempCorF - ((bcd_msb<<3) + (bcd_msb<<1)); 
  // Capturing overflow bit
  assign bcd_lsb_carry = bcd_lsb > 4'h9;
 
  //shift register for the input (SIO)
  always @(posedge SCK or negedge rst_n)
    if (~rst_n)
      shift_reg <= 8'h00;
    else
      begin
        shift_reg <= shift_reg<<1;
	    shift_reg[0] <= SIO ;
      end

//SPI CLOCK SCK generator
 
  always @(negedge clk or negedge rst_n)
  if (~rst_n)
    SCK <= 1'b0;
  else if(CS)
    SCK <= 1'b0;
  else
    SCK <= ~SCK;

// Chip Select CS generator
assign CS = ~(spi_state == `SPI_READ);

// Signals to turn ON the external 7 segment display 
// Assigned to bidirectional output ports

  assign sel_ext[0] = (dispState == `DISP_CORF) & sel_ext_seg; //00->CORF
  assign sel_ext[1] = (dispState == `DISP_LSB)  & sel_ext_seg; //01->LSB
  assign sel_ext[2] = (dispState == `DISP_MSB)  & sel_ext_seg; //10->MSB
  
// 1 for MSB 0 for LSB always --> our covention

// 3-spi_state (IDLE, READ, LATCH) spi_state-machine
  reg [1:0] dispState;

always @(posedge clk or negedge rst_n)
  if (~rst_n)
      begin	    
        spi_state <= `SPI_IDLE;
        tempC_bin_latch <= 8'b0;
        dispState <= `DISP_CORF;
      end
  else if ((count >= `CS_LOW_COUNT) && (count < `CS_HIGH_COUNT) )
      begin
        spi_state <= `SPI_READ;
      end
  else if (count == `SPI_LATCH_COUNT)
      begin	    
        spi_state <= `SPI_LATCH;
        tempC_bin_latch <= shift_reg<<1;
        //small state machine to external 3 7 segment display
        case(dispState)
          `DISP_CORF: dispState <= `DISP_LSB; 
          `DISP_LSB: dispState <= `DISP_MSB; 
          `DISP_MSB: dispState <= `DISP_CORF; 
          default: dispState <= `DISP_CORF; 
        endcase  
      end
  else 
      begin	    
        spi_state <= `SPI_IDLE;
      end

  //5b Counter
  always @(posedge clk or negedge rst_n)
    if (~rst_n)
       count <= `RST_COUNT;
    else if (count == `MAX_COUNT)
       count <= `RST_COUNT;
    else
       count <= count + 1'b1;
 endmodule

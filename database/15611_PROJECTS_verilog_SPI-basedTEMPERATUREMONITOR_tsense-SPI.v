// This program was cloned from: https://github.com/Aman-Pani/PROJECTS
// License: MIT License

//DEFINES
`define RST_COUNT       5'd0
`define CS_LOW_COUNT    5'd4
`define CS_HIGH_COUNT   5'd20
`define WRITE_LSB_COUNT	5'd22
//`define WRITE_LSB_COUNT	5'd24
`define MAX_COUNT       5'd28
`define SPI_IDLE	2'b00
`define SPI_READ	2'b01
`define DISP_WRITE_MSB	2'b10
`define DISP_WRITE_LSB	2'b11

//Verilog code for continous SPI read of LM07
//
module LM07_read(SYSCLK, RSTN, CS, SCK, SIO, disp, dataSeg, dbugout);
  input SYSCLK;		//System clock from the testbench
  input RSTN;		//Active-low reset signal
  input SIO;		//Serial data output from the temp sensor.
  output CS;	//Generate the Chip select for temp sensor
  output reg SCK;	//Generate the SPI clock for temp sensor
  output [1:0] disp;	//7-segment display select lines.
  output [7:0] dataSeg;  //7-segment data
  output [7:0] dbugout;	//the 8-bit data is latched for display
  
  reg SYSCLK_HALF;
  reg [7:0] shift_reg;
  reg [1:0] spi_state;
  reg [4:0] count;
  wire sysclk_gated;
  wire [7:0] temp_bin;
  wire [3:0] bcd_msb;
  wire [3:0] bcd_lsb;
  wire [3:0] bcd_data;

  //This output reg for debug purpose
  //assign dbugout = shift_reg;
  assign dbugout[7:4] = bcd_msb;
  assign dbugout[3:0] = bcd_lsb;
    
  //7-Segment select lines for MSB and LSB
  assign disp[1] = (spi_state == `DISP_WRITE_MSB);
  assign disp[0] = (spi_state == `DISP_WRITE_LSB);

  //2:1 MUX for sending MSB/LSB data to the 7-segment display
  assign bcd_data = (spi_state == `DISP_WRITE_MSB) ? bcd_msb : bcd_lsb ;

  //BCD to 7-segment decoder
  assign dataSeg[7] = (~bcd_data[2] && ~bcd_data[0]) || bcd_data[1] || bcd_data[0] || (bcd_data[2] && bcd_data[0]); //a
  assign dataSeg[6] = ~bcd_data[2] || (~bcd_data[1] && ~bcd_data[0]) || (bcd_data[1] && bcd_data[0]);  //b
  assign dataSeg[5] = ~bcd_data[1] || bcd_data[0] || bcd_data[2]; //c
  assign dataSeg[4] = (~bcd_data[2] && ~bcd_data[0]) || (~bcd_data[2] && bcd_data[1]) || (bcd_data[2] && ~bcd_data[1] && bcd_data[0]) || (bcd_data[1] && ~bcd_data[0]) || bcd_data[3]; //d
  assign dataSeg[3] = (~bcd_data[2] && ~bcd_data[0]) || (bcd_data[1] && ~bcd_data[0]); //e
  assign dataSeg[2] = (~bcd_data[1] && ~bcd_data[0]) || (bcd_data[2] && ~bcd_data[1]) || (bcd_data[2] && ~bcd_data[0]) || bcd_data[3]; //f
  assign dataSeg[1] = (~bcd_data[2] && bcd_data[1]) || (bcd_data[2] && ~bcd_data[1]) || bcd_data[3] || (bcd_data[2] && ~bcd_data[0]); //g
  assign dataSeg[0] = 1'b0; //DP

  //If you are reading 8-bits from the sensor, the LSB is 2-deg C
  //So multiply it by 2 to convert it to the right magnitude.
  assign temp_bin = shift_reg<<1;

  //Converting 7-bit binary to BCD value
  //BCD(MSB) = Temp./10 approx= Temp(1/16 + 1/32)
  //NOTE: First add then shift by 4 to avoid truncation error.
  assign bcd_msb = (temp_bin + (temp_bin>>1))>>4;
  
  //BCD(LSB) = temp - 10*MSB = temp - (8*MSB + 2*MSB)
  assign bcd_lsb = temp_bin - ((bcd_msb<<3) + (bcd_msb<<1));

  //shift register for the input (SIO)
  always @(posedge SCK or negedge RSTN)
    if (~RSTN)
      shift_reg <= 8'h00;
    else
      begin
        shift_reg <= shift_reg<<1;
	shift_reg[0] <= SIO;
      end

  //SPI CLOCK SCK generator
  always @(negedge SYSCLK or negedge RSTN)
    if (~RSTN || CS)
      SCK <= 1'b0;
    else
      SCK <= ~SCK;
  
  // Chip Select CS generator
  assign CS = ~(spi_state == `SPI_READ);

  // 4-state (IDLE, READ, MSB_WRITE, LSB_WRITE) state-machine
  always @(posedge SYSCLK or negedge RSTN)
    if (~RSTN)
      begin	    
        spi_state <= `SPI_IDLE;
      end
    else if ((count >= `CS_LOW_COUNT) && (count < `CS_HIGH_COUNT) )
      begin
        spi_state <= `SPI_READ;
      end
    else if (count == `CS_HIGH_COUNT)
      begin	    
        spi_state <= `DISP_WRITE_MSB;
      end
    else if (count == `WRITE_LSB_COUNT)
      begin	    
        spi_state <= `DISP_WRITE_LSB;
      end
    else 
      begin	    
        spi_state <= `SPI_IDLE;
      end

  //5-bit Counter
  always @(negedge SYSCLK or negedge RSTN)
    if (~RSTN)
       count <= `RST_COUNT;
    else if (count == `MAX_COUNT)
       count <= `RST_COUNT;
    else
       count <= count + 1'b1;

endmodule
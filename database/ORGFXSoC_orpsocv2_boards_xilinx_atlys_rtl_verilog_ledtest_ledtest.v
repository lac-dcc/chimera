//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:10:20 01/26/2012 
// Design Name: 
// Module Name:    test 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

//`include "ledtest_wb_slave.v"
//`include "ledmod.v"

/*
 *
 * Simple 24-bit wide GPIO module
 * 
 * Can be made wider as needed, but must be done manually.
 * 
 * First lot of bytes are the GPIO I/O regs
 * Second lot are the direction registers
 * 
 * Set direction bit to '1' to output corresponding data bit.
 *
 * Register mapping:
 *  
 * For 8 GPIOs we would have
 * adr 0: gpio data 7:0
 * adr 1: gpio data 15:8
 * adr 2: gpio data 23:16
 * adr 3: gpio dir 7:0
 * adr 4: gpio dir 15:8
 * adr 5: gpio dir 23:16
 * 
 * Backend pinout file needs to be updated for any GPIO width changes.
 * 
 */ 

module ledtest(
	    wb_clk,
	    wb_rst,
	    
	    wb_dat_i,
	    wb_we_i,
	    wb_cyc_i,
	    wb_stb_i,
	    wb_cti_i,
	    wb_bte_i,

	    wb_ack_o,
	    wb_dat_o,
	    wb_err_o,
	    wb_rty_o,

	    led_o);

   input wb_clk;
   input wb_rst;
   
   input [7:0] wb_dat_i;
   input 		    wb_we_i;
   input 		    wb_cyc_i;
   input 		    wb_stb_i;
   input [2:0] 		    wb_cti_i;
   input [1:0] 		    wb_bte_i;
   output reg [7:0] wb_dat_o; // constantly sampling gpio in bus
   output reg 		     wb_ack_o;
   output 		     wb_err_o;
   output 		     wb_rty_o;   

   output [7:0] led_o;

   // Internal registers
   reg [7:0]   set;

   assign led_o = set;
   
   // GPIO data out register
   always @(posedge wb_clk)
     if (wb_rst)
       set <= 0; // All set to in at reset
     else if (wb_stb_i & wb_we_i)
       begin
	  set <= wb_dat_i;
/*	  if (wb_adr_i == 1)
	    gpio_o[15:8] <= wb_dat_i;
   	  if (wb_adr_i == 2)
	    gpio_o[23:16] <= wb_dat_i; */
	  /* Add appropriate address detection here for wider GPIO */
       end
   
   // Ack generation
   always @(posedge wb_clk)
     if (wb_rst)
       wb_ack_o <= 0;
     else if (wb_ack_o)
       wb_ack_o <= 0;
     else if (wb_stb_i & !wb_ack_o)
       wb_ack_o <= 1;

   assign wb_err_o = 0;
   assign wb_rty_o = 0;
   

endmodule // gpio
/*
module ledtest(
    // wb slave
    wb_clk,
    wb_rst,
    
    wb_dat_i,
    wb_we_i,
    wb_cyc_i,
    wb_stb_i,
    wb_cti_i,
    wb_bte_i,

    wb_ack_o,
    wb_dat_o,
    wb_err_o,
    wb_rty_o,

    led_o	// output led
    );

   input wb_clk;
   input wb_rst;
   
   input [7:0] 		    wb_dat_i;
   input 		    wb_we_i;
   input 		    wb_cyc_i;
   input 		    wb_stb_i;
   input [2:0] 		    wb_cti_i;
   input [1:0] 		    wb_bte_i;
   output [7:0] 	    wb_dat_o;
   output 		    wb_ack_o;
   output 		    wb_err_o;
   output 		    wb_rty_o;   

   output [7:0] led_o;

   wire [7:0] set;

   ledtest_wb_slave wbs
   (
      .wb_clk	(wb_clk),
      .wb_rst	(wb_rst),
      .wb_dat_i (dat),
      .wb_we_i (we),
      .wb_cyc_i	(wb_cyc_i),
      .wb_stb_i (stb),
      .wb_cti_i	(wb_cti_i),
      .wb_bte_i	(wb_bte_i),
      .wb_dat_o	(wb_dat_o),
      .wb_err_o	(wb_err_o),
      .wb_rty_o	(wb_rty_o),
      .led_o	(set)
   );

   ledmod mod
   (
      .set_i	(set),
      .led_o	(led_o)
   );

endmodule */

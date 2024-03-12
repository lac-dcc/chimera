/*
 *
 * Simple 8-bit wide Led module
 * 
 * Set output bit to '1' to output corresponding data bit.
 *
 * Register mapping:
 *  
 * adr 0: led data 7:0
 * 
 */ 

module ledtest_wb_slave(
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
   
   input [7:0]              wb_dat_i;
   input 		    wb_we_i;
   input 		    wb_cyc_i;
   input 		    wb_stb_i;
   input [2:0] 		    wb_cti_i;
   input [1:0] 		    wb_bte_i;
   output reg [7:0]         wb_dat_o;
   output reg 		    wb_ack_o;
   output 		    wb_err_o;
   output 		    wb_rty_o;   

   output [7:0] led_o;

   // Internal registers
   reg [7:0]   led_reg_o;
   
   // LED data out register
   always @(posedge wb_clk)
     if (wb_rst)
       led_reg_o <= 0; // All set to in at reset
     else if (wb_stb_i & wb_we_i)
       begin
	 led_reg_o <= wb_dat_i;
       end
   
   // Ack generation
   always @(posedge wb_clk)
     if (wb_rst)
       wb_ack_o <= 0;
     else if (wb_ack_o)
       wb_ack_o <= 0;
     else if (wb_stb_i & !wb_ack_o)
       wb_ack_o <= 1;

   // Drive output
   assign led_o = led_reg_o;

   assign wb_err_o = 0;
   assign wb_rty_o = 0;
endmodule // ledtest_wb_slave

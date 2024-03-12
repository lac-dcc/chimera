/*
 *
 * Simple 8-bit wide GPIO module
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
 * adr 1: gpio dir 7:0
 * 
 * 
 * So for 24 GPIOs we would have
 * adr 0: gpio data 7:0
 * adr 1: gpio data 15:8
 * adr 2: gpio data 24:16
 * adr 3: gpio dir 7:0
 * adr 4: gpio dir 15:8
 * adr 5: gpio dir 24:16
 *
 * Obviously any width where width%8!=0 you must skip the remainder of the byte
 * before starting the dir registers.
 * 
 * Backend pinout file needs to be updated for any GPIO width changes.
 * 
 */ 

module gpio(
	    wb_clk,
	    wb_rst,
	    
	    wb_adr_i,
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

	    gpio_io);


   parameter gpio_io_width = 8;

   parameter gpio_dir_reset_val = 0;
   parameter gpio_o_reset_val = 0;
   
   
   parameter wb_dat_width = 8;
   parameter wb_adr_width = 3; // 8 bytes addressable
   
   input wb_clk;
   input wb_rst;
   
   input [wb_adr_width-1:0] wb_adr_i;
   input [wb_dat_width-1:0] wb_dat_i;
   input 		    wb_we_i;
   input 		    wb_cyc_i;
   input 		    wb_stb_i;
   input [2:0] 		    wb_cti_i;
   input [1:0] 		    wb_bte_i;
   output reg [wb_dat_width-1:0] wb_dat_o; // constantly sampling gpio in bus
   output reg 		     wb_ack_o;
   output 		     wb_err_o;
   output 		     wb_rty_o;   

   inout [gpio_io_width-1:0] gpio_io;

   // Internal registers
   reg [gpio_io_width-1:0]   gpio_dir;

   reg [gpio_io_width-1:0]   gpio_o;

   wire [gpio_io_width-1:0]  gpio_i;

   // Tristate logic for IO
   genvar 		     i;
   generate 
      for (i=0;i<gpio_io_width;i=i+1)  begin: gpio_tris
	 assign gpio_io[i] = (gpio_dir[i]) ? gpio_o[i] : 1'bz;
	 assign gpio_i[i] = (gpio_dir[i]) ? gpio_o[i] : gpio_io[i];
      end
   endgenerate
   

   // GPIO dir register
   always @(posedge wb_clk)
     if (wb_rst)
       gpio_dir <= 0; // All set to in at reset
     else if (wb_stb_i & wb_we_i)
       begin
	  if (wb_adr_i == ((gpio_io_width/8)))
	    gpio_dir[7:0] <= wb_dat_i;
/*
	  if (wb_adr_i == ((gpio_io_width/8)+1))
	    gpio_dir[15:8] <= wb_dat_i;
   	  if (wb_adr_i == ((gpio_io_width/8)+2))
	    //gpio_dir[23:16] <= wb_dat_i;
	    gpio_dir[21:16] <= wb_dat_i[5:0];
 */
	  /* Add appropriate address detection here for wider GPIO */

       end


   // GPIO data out register
   always @(posedge wb_clk)
     if (wb_rst)
       gpio_o <= 0; // All set to in at reset
     else if (wb_stb_i & wb_we_i)
       begin
	  if (wb_adr_i == 0)
	    gpio_o[7:0] <= wb_dat_i;
/*
	  if (wb_adr_i == 1)
	    gpio_o[15:8] <= wb_dat_i;
   	  if (wb_adr_i == 2)
	    gpio_o[23:16] <= wb_dat_i;
 */
	  /* Add appropriate address detection here for wider GPIO */
       end
   

   // Register the gpio in signal
   always @(posedge wb_clk)
     begin
	// Data regs
	if (wb_adr_i == 0)
	  wb_dat_o[7:0] <= gpio_i[7:0];
/*
	if (wb_adr_i == 1)
	  wb_dat_o[7:0] <= gpio_i[15:8];
	if (wb_adr_i == 2)
	  wb_dat_o[7:0] <= gpio_i[23:16];
*/
	/* Add appropriate address detection here for wider GPIO */	  
	// Direction regs
	if (wb_adr_i == 1)
	  wb_dat_o[7:0] <= gpio_dir[7:0];
/*
	if (wb_adr_i == 4)
	  wb_dat_o[7:0] <= gpio_dir[15:8];
	if (wb_adr_i == 5)
	  wb_dat_o[7:0] <= gpio_dir[23:16];
*/
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

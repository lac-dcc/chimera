// Wrapper for Actel flash ROM
// 2 cycles from request to ACK

module flashrom(
		wb_clk,
		wb_rst,
		wb_adr_i,
		wb_cyc_i,
		wb_stb_i,

		wb_ack_o,
		wb_dat_o,
		wb_err_o,
		wb_rty_o);


   input wb_clk;
   input wb_rst;
   input [6:0] wb_adr_i;
   input       wb_cyc_i;
   input       wb_stb_i;
   
   output      wb_ack_o;
   output reg [7:0] wb_dat_o;
   output 	    wb_err_o;
   output 	    wb_rty_o;
   
   
   reg [3:0] 	    ack_shr;   
   reg [6:0] 	    addr;
   wire [7:0] 	    dat;
   reg [7:0] 	    dat_r;
   
   wire 	    wb_access;
   
   assign wb_access = wb_cyc_i & wb_stb_i;

   always @(posedge wb_clk)
     if (wb_rst)
       ack_shr <= 0;
     else if (wb_access & !(|ack_shr))
       ack_shr[0] <= 1'b1;
     else
       ack_shr <= {ack_shr[2:0],1'b0};

   assign wb_ack_o = ack_shr[3];
 
   always @(posedge wb_clk)
     if (wb_access & !(|ack_shr))
       addr <= wb_adr_i;
   
   orpsoc_flashROM orpsoc_flashROM0
     (
      .CLK(wb_clk),
      .ADDR(addr),
      .DOUT(dat)
      );

   always @(posedge wb_clk)
     dat_r <= dat;

   always @(posedge wb_clk)
     wb_dat_o <= dat_r;

   assign wb_err_o = 0;
   assign wb_rty_o = 0;

endmodule // flashrom

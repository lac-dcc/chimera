module fsm_wb (
	       stall_i, stall_o,
	       we_i, cti_i, bte_i, stb_i, cyc_i, ack_o,
	       egress_fifo_we, egress_fifo_full,
	       ingress_fifo_re, ingress_fifo_empty,
	       state_idle,
	       sdram_burst_reading,
	       debug_state,
	       wb_clk, wb_rst
	       );

   input stall_i;
   output stall_o;

   input [2:0] cti_i;
   input [1:0] bte_i;
   input       we_i, stb_i, cyc_i;
   output      ack_o;
   output      egress_fifo_we, ingress_fifo_re;
   input       egress_fifo_full, ingress_fifo_empty;
   input       sdram_burst_reading;
   output      state_idle;
   input       wb_clk, wb_rst;
   output [1:0] debug_state;
   
   

   reg 	       ingress_fifo_read_reg;

   // bte
   parameter linear       = 2'b00;
   parameter wrap4        = 2'b01;
   parameter wrap8        = 2'b10;
   parameter wrap16       = 2'b11;
   // cti
   parameter classic      = 3'b000;
   parameter endofburst   = 3'b111;

   parameter idle = 2'b00;
   parameter rd   = 2'b01;
   parameter wr   = 2'b10;
   parameter fe   = 2'b11;
   reg [1:0]   state;

   assign debug_state = state;
   

   reg 	       sdram_burst_reading_1, sdram_burst_reading_2;
   wire        sdram_burst_reading_wb_clk;
   

   always @ (posedge wb_clk or posedge wb_rst)
     if (wb_rst)
       state <= idle;
     else
       case (state)
         idle:
           if (we_i & stb_i & cyc_i & !egress_fifo_full & !stall_i)
             state <= wr;
           else if (!we_i & stb_i & cyc_i & !egress_fifo_full & !stall_i)
             state <= rd;
         wr:
           if ((cti_i==classic | cti_i==endofburst | bte_i==linear) & 
	       stb_i & cyc_i & !egress_fifo_full & !stall_i)
             state <= idle;
         rd:
           if ((cti_i==classic | cti_i==endofburst | bte_i==linear) & 
	       stb_i & cyc_i & ack_o)
             state <= fe;
         fe:
           if (ingress_fifo_empty & !sdram_burst_reading_wb_clk)
             state <= idle;
         default: ;
       endcase
   
   assign state_idle = (state==idle);
   
   assign stall_o = (stall_i) ? 1'b1 :
                    (state==idle & stb_i & cyc_i & !egress_fifo_full) ? 1'b1 :
                    (state==wr   & stb_i & cyc_i & !egress_fifo_full) ? 1'b1 :
                    (state==rd   & stb_i & cyc_i & !ingress_fifo_empty) ? 1'b1 :
                    (state==fe   & !ingress_fifo_empty) ? 1'b1 :
                    1'b0;
   
   assign egress_fifo_we = (state==idle & stb_i & cyc_i & !egress_fifo_full & !stall_i) ? 1'b1 :
                           (state==wr   & stb_i & cyc_i & !egress_fifo_full & !stall_i) ? 1'b1 :
                           1'b0;
   
   assign ingress_fifo_re = (state==rd & stb_i & cyc_i & !ingress_fifo_empty & !stall_i) ? 1'b1 :
                            (state==fe & !ingress_fifo_empty & !stall_i) ? 1'b1:
                            1'b0;
   
   always @ (posedge wb_clk or posedge wb_rst)
     if (wb_rst)
       ingress_fifo_read_reg <= 1'b0;
     else
       ingress_fifo_read_reg <= ingress_fifo_re;
   
   /*assign ack_o = (ingress_fifo_read_reg & stb_i) ? 1'b1 :
                  (state==fe) ? 1'b0 :
                  (state==wr & stb_i & cyc_i & !egress_fifo_full & !stall_i) ? 1'b1 :
                  1'b0;*/

   assign ack_o = !(state==fe) & ((ingress_fifo_read_reg & stb_i) | (state==wr & stb_i & cyc_i & !egress_fifo_full & !stall_i));


   // Sample the SDRAM burst reading signal in WB domain
   always @(posedge wb_clk)
     sdram_burst_reading_1 <= sdram_burst_reading;
   
   always @(posedge wb_clk)
     sdram_burst_reading_2 <= sdram_burst_reading_1;

   assign sdram_burst_reading_wb_clk = sdram_burst_reading_2;
   
endmodule
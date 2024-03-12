
module spram_wait (/*AUTOARG*/
   // Outputs
   ao_data, ao_valid,
   // Inputs
   clk, rst, ai_ce, ai_we, ai_oe,ai_addr_w,ai_addr_r, ai_data
   );

   parameter 
     dw = 8,
     aw = 8;
   
   // ************************************************

   input                   clk;
   input                   rst;

   //   
   input                   ai_ce;
   input                   ai_we;
   input                   ai_oe;
   input [aw-1: 0]         ai_addr_w;
   input [aw-1: 0]         ai_addr_r;
   input [dw-1: 0]         ai_data;

   output [dw-1: 0]        ao_data;
   output                  ao_valid;

   wire [aw-1: 0]         ai_addr_reg;
   wire [dw-1: 0]         co_data; 
   wire  fifo_adr_full,fifo_adr_empty;
   reg [2:0]               cnt;
   reg [1:0]               delay; 
   fifo_1depth #(
                 .dw(aw)
                 )
		 fifo_adr (
	                     .clk                 (clk), 
	                     .clr                 (rst),
	                     // input side
	                     .we                  (ai_ce),
	                     .dati                (ai_addr_r),
	                     .full                (fifo_adr_full),
	                     // output side
	                     .dato                (ai_addr_reg),
	                     .empty               (fifo_adr_empty),
	                     .re                  (ao_valid && !fifo_adr_empty)
                             );

   wire [aw-1: 0] co_addr = ao_valid ? ai_addr_r : ai_addr_reg;
   wire [dw-1: 0] ao_data = ao_valid ? co_data : {dw{1'bx}};
  
   
   
   spram2  #(
               .dw                  (dw),
               .aw                  (aw)
                 ) sram (
                // Outputs
                .ao_data                (co_data[dw-1:0]),
                // Inputs
                .clk                    (clk),
                .rst                    (rst),
                .ai_ce                  (ai_ce),
                .ai_we                  (ai_we),
                .ai_oe                  (ai_oe),
		.ai_addr_w              (ai_addr_w),
                .ai_addr_r              (co_addr[aw-1:0]),
                .ai_data                (ai_data[dw-1:0]),
		.ao_valid               (ao_valid));

   wire                    ao_valid = (delay == 0);


   always @(posedge clk) 
      if (rst) begin
         cnt <= 0;
         delay <= 0;
      end
      else if (ai_ce && ai_oe && cnt != 7) begin
               cnt <= cnt + 1;
               delay <= 0;end
      else if (ai_ce && ai_oe && cnt == 7)
		if(delay != 3) 
                 delay <= delay + 1;
		else begin
		cnt <= 0;
		delay <= 0;end	
      else if(delay == 3)begin
		cnt <= 0;
		delay <= 0;end
      else if(delay != 0)
		delay <= delay + 1;

 
   
   
endmodule // module sram_rdma

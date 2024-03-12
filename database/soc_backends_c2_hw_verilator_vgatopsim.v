
// Must synthesize into 3 * 8x2048 brams
module vram(input clk,
	    
	    input [19:0]     p1_addr,
	    input [7:0]      p1_data,
            output [7:0] p1_data_out, 
	    input            p1_we,
            input            p1_re,

	    input [19:0]     p2_addr,
	    output [7:0] p2_data);

   reg [7:0] 		 mem[0:153600-1];
   assign p1_data_out = p1_re?mem[p1_addr]:0;
   assign p2_data = mem[p2_addr];

   always @(posedge clk)
     begin
	if (p1_we) begin
	   mem[p1_addr] <= p1_data;
	end
     end

endmodule
	    
module vgatopgfxsim(input clk, // 100MHz clk
	            input        rst,
	           
                    input        clsrq,
                    output reg   clsack,

	            input [19:0] vmem_in_addr,
	            input [7:0]  vmem_in_data,
	            input        vmem_we,
                    input        vmem_re,
                    output [7:0] vmem_p1_out_data,

                    input [19:0] vmem_out_addr,
                    output [7:0] vmem_out_data
                    );


   reg                     clsing;
   reg [19:0]              clsaddr;
   

   wire [19:0]             vmem_in_addr_x;
   wire [7:0]              vmem_in_data_x;
   wire                    vmem_we_x;

   assign vmem_in_addr_x = clsing?clsaddr:vmem_in_addr;
   assign vmem_in_data_x = clsing?0:vmem_in_data;
   assign vmem_we_x = clsing|vmem_we;


   wire                    vmem_re_x;
   
   assign vmem_re_x = clsing?0:vmem_re;
   


   always @(posedge clk)
     if (!rst) begin
        clsing <= 0;
        clsack <= 0;
        clsaddr <= 0;
     end else begin
        if (clsack) clsack <= 0;
        else if (clsrq && !clsing) begin
           clsing <= 1;
           clsaddr <= 0;
           clsack <= 0;
        end else if (clsing) begin
           clsaddr <= clsaddr + 1;
           if (clsaddr == 153600) begin
              clsack <= 1;
              clsing <= 0;
           end
        end
     end
   
   vram vram1(.clk(clk),

	      .p1_addr(vmem_in_addr_x),
	      .p1_data(vmem_in_data_x),
	      .p1_we(vmem_we_x),
              .p1_re(vmem_re_x),
              .p1_data_out(vmem_p1_out_data),

	      .p2_addr(vmem_out_addr),
	      .p2_data(vmem_out_data)
	      );

endmodule

	      


// Must synthesize into 3 * 8x2048 brams
module vram(input clk,
	    
	    input [12:0]     p1_addr,
	    input [7:0]      p1_data,
	    input 	     p1_we,

	    input [12:0]     p2_addr,
	    output reg [7:0] p2_data);

   reg [7:0] 		 mem[0:(3*2048)-1];

   always @(posedge clk)
     begin
	if (p1_we) begin
	   mem[p1_addr] <= p1_data;
	end
	p2_data <= mem[p2_addr];
     end

endmodule
	    


module vgatop(input clk, // 100MHz clk
	      input        rst,
	      input        clk25mhz,

	      output       hsync,
	      output       vsync,
	      output       rgb,

	      input [12:0] vmem_in_addr,
	      input [7:0]  vmem_in_data,
	      input        vmem_we);


   wire [12:0] 		   vmem_out_addr;
   wire [7:0] 		   vmem_out_data;
   
   vram vram1(.clk(clk),

	      .p1_addr(vmem_in_addr),
	      .p1_data(vmem_in_data),
	      .p1_we(vmem_we),

	      .p2_addr(vmem_out_addr),
	      .p2_data(vmem_out_data)
	      );

   vga vga1(.clk(clk),
	    .rst(rst),
	    .clk25mhz(clk25mhz),
	    
	    .vmem_data(vmem_out_data),
	    .vmem_addr(vmem_out_addr),
	    
	    .hsync(hsync),
	    .vsync(vsync),
	    .rgb(rgb));

endmodule

	      

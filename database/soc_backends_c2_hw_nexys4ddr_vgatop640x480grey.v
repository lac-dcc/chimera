
// Must synthesize into 3 * 8x2048 brams
module vram(input clk,
	    
	    input [19:0]     p1_addr,
	    input [7:0]      p1_data,
            output reg [7:0] p1_data_out, 
	    input            p1_we,
            input            p1_re,

	    input [19:0]     p2_addr,
	    output reg [7:0] p2_data);

   reg [7:0] 		 mem[0:153600-1];


   always @(posedge clk)
     begin
	if (p1_we) begin
	   mem[p1_addr] <= p1_data;
	end else if (p1_re) begin
           p1_data_out <= mem[p1_addr];
        end
	p2_data <= mem[p2_addr];
     end

endmodule
	    


module vgatopgfx(input clk, // 100MHz clk
	         input        rst,
	         input        clk25mhz,

	         output       hsync,
	         output       vsync,
	         output [3:0] rgb,

                 input        clsrq,
                 output reg   clsack,

                 input        bufswap,

	         input [19:0] vmem_in_addr,
	         input [7:0]  vmem_in_data,
	         input        vmem_we,
                 input        vmem_re,
                 output [7:0] vmem_p1_out_data,

                 output       vga_scan
                 );


   wire [19:0] 		   vmem_out_addr;
   wire [7:0] 		   vmem_out_data;

   reg                     clsing;
   reg [19:0]              clsaddr;
   

   wire [19:0]             vmem_in_addr_x;
   wire [7:0]              vmem_in_data_x;
   wire                    vmem_we_x;

   reg [19:0]              vmem_in_addr_r;
   reg [7:0]               vmem_in_data_r;
   reg                     vmem_we_r;

   assign vmem_in_addr_x = clsing?clsaddr:vmem_in_addr_r;
   assign vmem_in_data_x = clsing?0:vmem_in_data_r;
   assign vmem_we_x = clsing|vmem_we_r;


   wire                    vmem_re_x;
   
   
   assign vmem_re_x = clsing?0:vmem_re;
   

   always @(posedge clk)
     if (!rst) begin
        clsing <= 0;
        clsack <= 0;
        clsaddr <= 0;
        vmem_in_addr_r <= 0;
        vmem_in_data_r <= 0;
        vmem_we_r <= 0;
     end else begin
        vmem_in_addr_r <= vmem_in_addr;
        vmem_in_data_r <= vmem_in_data;
        vmem_we_r <= vmem_we;
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
     end // else: !if(!rst)

   wire buf1;
   wire buf2;

   assign buf1 = bufswap;
   assign buf2 = ~bufswap;


   wire [7:0] vmem_out_data_1;
   wire [7:0] vmem_out_data_2;

   assign vmem_out_data = buf1?vmem_out_data_1:vmem_out_data_2;
   
   wire [7:0] vmem_p1_out_data_1;
   wire [7:0] vmem_p1_out_data_2;

   assign vmem_p1_out_data = buf2?vmem_p1_out_data_1:vmem_p1_out_data_2;
   
   
   vram vram1(.clk(clk),

	      .p1_addr(vmem_in_addr_x),
	      .p1_data(vmem_in_data_x),
	      .p1_we(buf2?vmem_we_x:0),
              .p1_re(buf2?vmem_re_x:0),
              .p1_data_out(vmem_p1_out_data_1),

	      .p2_addr(vmem_out_addr),
	      .p2_data(vmem_out_data_1)
	      );

   vram vram2(.clk(clk),

	      .p1_addr(vmem_in_addr_x),
	      .p1_data(vmem_in_data_x),
	      .p1_we(buf1?vmem_we_x:0),
              .p1_re(buf2?vmem_re_x:0),
              .p1_data_out(vmem_p1_out_data_2),

	      .p2_addr(vmem_out_addr),
	      .p2_data(vmem_out_data_2)
	      );

   vgagfx vga1(.clk(clk),
	       .rst(rst),
	       .clk25mhz(clk25mhz),
	       
	       .vmem_data(vmem_out_data),
	       .vmem_addr(vmem_out_addr),
	       
	       .hsync(hsync),
	       .vsync(vsync),
	       .rgb(rgb),
               .scan(vga_scan));

endmodule

	      

// Must be generated:
//
//  ram4k_low_low     0     .. 2047
//  ram4k_low_high    2048  .. 4095
//  ram4k_high_low    4096  .. 6143
//  ram4k_high_high   6144  .. 8191


module ram8k_low(input clk,
	         input [11:0]  addr,
	         input [15:0]  data_in,
	         output [15:0] data_out,
	         input         we,
	         input         re);

   wire [15:0]                  data_out_low;
   wire [15:0]                  data_out_high;
   wire                         we_low;
   wire                         re_low;

   wire                         we_high;
   wire                         re_high;

   // Each block is 4048 words; each, in turn,
   //     made of two 2024 word block
   ram4k_low_low r1(.clk(clk),
                    .addr(addr[10:0]),
                    .data_in(data_in),
                    .data_out(data_out_low),
                    .we(we_low),
                    .re(re_low));

   ram4k_low_high r2(.clk(clk),
                     .addr(addr[10:0]),
                     .data_in(data_in),
                     .data_out(data_out_high),
                     .we(we_high),
                     .re(re_high));

   reg                          on_high;
   always @(posedge clk) on_high <= addr[11];
   
   assign data_out = on_high?data_out_high:data_out_low;
   assign we_high   = addr[11]&we;
   assign we_low    = (~addr[11])&we;
   
   assign re_low    = 1;
   assign re_high   = 1;
   
endmodule // ram8k

module ram8k_high(input clk,
	          input [11:0]  addr,
	          input [15:0]  data_in,
	          output [15:0] data_out,
	          input         we,
	          input         re);

   wire [15:0]                  data_out_low;
   wire [15:0]                  data_out_high;
   wire                         we_low;
   wire                         re_low;

   wire                         we_high;
   wire                         re_high;

   // Each block is 4048 words; each, in turn,
   //     made of two 2024 word block
   ram4k_high_low r1(.clk(clk),
                     .addr(addr[10:0]),
                     .data_in(data_in),
                     .data_out(data_out_low),
                     .we(we_low),
                     .re(re_low));
   
   ram4k_high_high r2(.clk(clk),
                      .addr(addr[10:0]),
                      .data_in(data_in),
                      .data_out(data_out_high),
                      .we(we_high),
                      .re(re_high));
   
   reg                          on_high;
   always @(posedge clk) on_high <= addr[11];
   
   assign data_out = on_high?data_out_high:data_out_low;
   assign we_high   = addr[11]&we;
   assign we_low    = (~addr[11])&we;
   
   assign re_low    = 1;
   assign re_high   = 1;
   
endmodule // ram8k



// wrapper for 2 memory bundles on HX8k,
// will be only one on 1k
`ifndef ICESTICK
module ram16k(input clk,
	      input [12:0] 	addr,
	      input [15:0] 	data_in,
	      output [15:0] data_out,
	      input 		we,
	      input 		re);

   wire [15:0]                  data_out_low;
   wire [15:0]                  data_out_high;
   wire                         we_low;
   wire                         re_low;

   wire                         we_high;
   wire                         re_high;

   // Each block is 4048 words; each, in turn,
   //     made of two 2024 word block
   ram8k_low r1(.clk(clk),
                .addr(addr[11:0]),
                .data_in(data_in),
                .data_out(data_out_low),
                .we(we_low),
                .re(re_low));
  
   ram8k_high r2(.clk(clk),
                 .addr(addr[11:0]),
                 .data_in(data_in),
                 .data_out(data_out_high),
                 .we(we_high),
                 .re(re_high));

   reg                          on_high;
   always @(posedge clk) on_high <= addr[12];
   
   assign data_out = on_high?data_out_high:data_out_low;
   assign we_high   = addr[12]&we;
   assign we_low    = (~addr[12])&we;
   
   assign re_low    = 1;
   assign re_high   = 1;
   
endmodule // ram16k

`else // !`ifndef ICESTICK
module ram16k(input clk,
	      input [12:0] 	addr,
	      input [15:0] 	data_in,
	      output [15:0] data_out,
	      input 		we,
	      input 		re);

   // Only low half is available anyway
   ram8k_low r1(.clk(clk),
                .addr(addr[11:0]),
                .data_in(data_in),
                .data_out(data_out),
                .we(we&(~addr[12])),
                .re(re&(~addr[12])));
endmodule
`endif

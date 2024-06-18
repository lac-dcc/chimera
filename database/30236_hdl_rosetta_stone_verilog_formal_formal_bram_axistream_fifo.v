// This program was cloned from: https://github.com/TripRichert/hdl_rosetta_stone
// License: MIT License

localparam DATA_WIDTH = 8;
localparam ADDR_WIDTH = 3;

module formal_bram_axistream_fifo
  (
   clk,
   rst,

   src_tvalid,
   src_tready,
   src_tdata,
   src_tlast,

   dest_tvalid,
   dest_tready,
   dest_tdata,
   dest_tlast,

   data_cnt
   );
   
   input clk;
   input rst;
   input src_tvalid;
   output src_tready;
   input [(DATA_WIDTH-1):0] src_tdata;
   input 		    src_tlast;

   output 		    dest_tvalid;
   input 		    dest_tready;
   output [DATA_WIDTH-1:0]  dest_tdata;
   output 		    dest_tlast;
   output [ADDR_WIDTH:0]    data_cnt;
   


   reg                       init_1z;

   reg [(DATA_WIDTH):0]    data [2**ADDR_WIDTH:0];
   reg [ADDR_WIDTH:0]      index;
   reg 			   rst_1z;
   
   
   

   bram_axistream_fifo #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH))
                   uut(
                       .clk(clk),
                       .rst(rst),

		       .src_tvalid(src_tvalid),
		       .src_tready(src_tready),
		       .src_tdata(src_tdata),
		       .src_tlast(src_tlast),

		       .dest_tvalid(dest_tvalid),
		       .dest_tready(dest_tready),
		       .dest_tdata(dest_tdata),
		       .dest_tlast(dest_tlast),

		       .data_cnt(data_cnt)
                       );



   initial assume(rst);


   initial begin
      init_1z = 0;
      rst_1z = 0;
   end
   
   always @(posedge clk) begin
      if (!init_1z) begin
         assume(rst);
      end
      init_1z <= 1'b1;
      rst_1z <= rst;

   end

   initial begin
      index = 0;
   end
   integer i;
   
   always @(posedge clk) begin
      if (rst) begin
         index <= 0;
      end else begin
         if (src_tvalid && src_tready && dest_tvalid && dest_tready) begin
            for(i = 1; i < 2**ADDR_WIDTH + 1; i=i+1) begin
               if (i < index) begin
                  data[i-1] <= data[i];
               end
            end
            data[index - 1] <= src_tdata;
         end else if (src_tvalid && src_tready) begin
            data[index] <= src_tdata;
            index <= index + 1;
         end else if (dest_tvalid && dest_tready) begin
            for(i = 1; i < 2**ADDR_WIDTH + 1; i=i+1) begin
               if (i < index) begin
                  data[i-1] <= data[i];
               end
            end
            index <= index - 1;
         end
      end
      assert(index >= 0);
      assert(index <= 2**ADDR_WIDTH + 1);
      assert(!(rst && dest_tvalid && init_1z));
      assert(!(dest_tvalid && dest_tready) || dest_tdata == data[0]);
      
      
   end
      
endmodule

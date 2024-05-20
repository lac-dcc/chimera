// This program was cloned from: https://github.com/TripRichert/hdl_rosetta_stone
// License: MIT License

localparam DATA_WIDTH = 8;
localparam NUM_PACK = 4;
localparam BIG_ENDIAN = 1'b0;

module formal_axistream_pack
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
   dest_tlast
   );

   input clk;
   input rst;

   input src_tvalid;
   output src_tready;
   input [(DATA_WIDTH-1):0] src_tdata;
   input 		    src_tlast;

   output 		             dest_tvalid;
   input 		             dest_tready;
   output [DATA_WIDTH*NUM_PACK-1:0]  dest_tdata;
   output 		             dest_tlast;
   

   reg 				     init_1z;
   integer 			     index;
   integer 			     inv_index;
   reg 				     tlast_1z;
   
   
   
   reg [DATA_WIDTH-1:0]  data_buffer [NUM_PACK-1:0];

   axistream_pack #(
		    .DATA_WIDTH(DATA_WIDTH),
		    .NUM_PACK(NUM_PACK),
		    .BIG_ENDIAN(BIG_ENDIAN)
		    ) uut (
			   .clk(clk),
			   .rst(rst),

			   .src_tvalid(src_tvalid),
			   .src_tready(src_tready),
			   .src_tdata(src_tdata),
			   .src_tlast(src_tlast),

			   .dest_tvalid(dest_tvalid),
			   .dest_tready(dest_tready),
			   .dest_tdata(dest_tdata),
			   .dest_tlast(dest_tlast)
			   );
   integer i;

   initial begin
      init_1z = 0;
      rst_1z = 0;
   end

   always @(posedge clk) begin
      assume(init_1z || rst);
      init_1z <= 1'b1;      
      cover(dest_tvalid && dest_tready);

      for (i = 0; i < NUM_PACK; i = i + 1) begin
	 assert(!(dest_tvalid && dest_tready && !rst) ||
	     dest_tdata[(i+1)*DATA_WIDTH-1:i*DATA_WIDTH] == data_buffer[i]);
      end
      
      assert(!(dest_tvalid && dest_tready && !rst) ||
	     tlast_1z == dest_tlast);

   end

   assign inv_index = NUM_PACK - 1 - index;
   initial begin
      index <= 0;
      tlast_1z <= 1'b0;
   end
   
   always @(posedge clk) begin
      if (rst) begin
	 index <= 0;
      end else begin
	 if (src_tvalid && src_tready) begin
	    tlast_1z <= src_tlast;
	    if (!BIG_ENDIAN) begin
	       for(i = 0; i < NUM_PACK; i = i + 1) begin
		  if (i == index) begin
		    data_buffer[index] <= src_tdata;
		  end else begin
		     data_buffer[i] <= data_buffer[i];
		  end
	       end
      	    end else begin
	       for(i = 0; i < NUM_PACK; i = i + 1) begin
		  if (i == inv_index) begin
		     data_buffer[inv_index] <= src_tdata;
		  end else begin
		     data_buffer[i] <= data_buffer[i];
		  end
	       end
	    end
	    index <= (index + 1) % NUM_PACK;
	 end
      end
   end

endmodule

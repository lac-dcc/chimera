// This program was cloned from: https://github.com/TripRichert/hdl_rosetta_stone
// License: MIT License


module formal_axistream_unpack
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
localparam DATA_WIDTH = 8;
localparam NUM_PACK = 4;
localparam BIG_ENDIAN = 1'b1;

   input clk;
   input rst;

   input src_tvalid;
   output src_tready;
   input [NUM_PACK*DATA_WIDTH-1:0] src_tdata;
   input 		    src_tlast;

   output 		             dest_tvalid;
   input 		             dest_tready;
   output [DATA_WIDTH-1:0]             dest_tdata;
   output 		             dest_tlast;
   

   reg 				     init_1z;
   reg 				     rst_1z;
   
   integer 			     index;
   integer 			     inv_index;

   wire [DATA_WIDTH-1:0] 	     src_tdata_arr [NUM_PACK-1:0];
   reg [DATA_WIDTH-1:0] 	     data_buf [NUM_PACK-1:0];
   
   reg 				     tlast_buf;
   

   

   
   genvar 			     i;
   generate
      for(i = 0; i < NUM_PACK; i = i + 1) begin
	 assign src_tdata_arr[i] = src_tdata[(i+1)*DATA_WIDTH-1:i*DATA_WIDTH];
      end
   endgenerate

   axistream_unpack #(
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

   initial begin
      index <= 0;
      inv_index <= NUM_PACK - 1;
   end
   integer j;
   always @(posedge clk) begin
     if (rst) begin
	 index <= 0;
	 inv_index <= NUM_PACK - 1;
     end else begin
	if (dest_tvalid && dest_tready) begin
	   index <= (index + 1) % NUM_PACK;
	   if (inv_index <= 0) begin
	      inv_index <= NUM_PACK - 1;
	   end else begin
	      inv_index <= inv_index - 1;
	   end
	end
	if (src_tvalid && src_tready) begin
	   tlast_buf <= src_tlast;
	   for (j = 0; j < NUM_PACK; j = j + 1) begin
	      data_buf[j] <= src_tdata_arr[j];
	   end
	end else begin
	   for (j = 0; j < NUM_PACK; j = j+1) begin
	      data_buf[j] <= data_buf[j];
	   end
	   tlast_buf <= tlast_buf;
	end
     end      
   end

   
   initial begin
      init_1z = 0;
      rst_1z = 0;
   end

   always @(posedge clk) begin
      assume(init_1z || rst);
      rst_1z <= rst;
      init_1z <= 1'b1;      
      cover(!rst && dest_tvalid && dest_tready);
      cover(!rst && index == 0 && $past(index) == NUM_PACK - 1);
      assume($past(inv_index) >= 0 && $past(inv_index) < NUM_PACK); 
      assert(inv_index >= 0 && inv_index < NUM_PACK);
      assume($past(index) >= 0 && $past(index) < NUM_PACK); 
      assert(index >= 0 && index < NUM_PACK);
     
      assert(!(dest_tvalid && dest_tready) || (index < NUM_PACK - 1) || (dest_tlast == tlast_buf));
      assert(!(dest_tvalid && dest_tready) || (index == NUM_PACK - 1) || dest_tlast == 1'b0);
      
      if (BIG_ENDIAN) begin
	 assert(!(dest_tvalid && dest_tready) || dest_tdata == data_buf[inv_index]);
      end else begin
	 assert(!(dest_tvalid && dest_tready) || dest_tdata == data_buf[index]);
      end
   end


endmodule

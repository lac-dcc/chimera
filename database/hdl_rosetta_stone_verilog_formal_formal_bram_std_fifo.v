// This program was cloned from: https://github.com/TripRichert/hdl_rosetta_stone
// License: MIT License

localparam DATA_WIDTH = 8;
localparam ADDR_WIDTH = 3;

module formal_bram_std_fifo
  (
   clk,
   rst,

   src_data,
   wr_en,
   rd_en,

   dest_data,
   full,
   empty
   );
   

   input clk;
   input rst;
   input [(DATA_WIDTH-1):0] src_data;
   input wr_en;
   input rd_en;
   output [(DATA_WIDTH-1):0] dest_data;
   output                    full;
   output                    empty;


   reg                       init_1z;
   reg                       was_full;

   reg [(DATA_WIDTH):0]    data [2**ADDR_WIDTH - 1:0];
   reg [ADDR_WIDTH:0]      index;
   reg                       rd_en_1z;
   reg [(DATA_WIDTH-1):0]    data0_1z;
   reg                       rst_1z;
   
   
   

   bram_std_fifo #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH))
                   uut(
                       .clk(clk),
                       .rst(rst),
                       .wr_en(wr_en),
                       .rd_en(rd_en),
                       .src_data(src_data),
                       .dest_data(dest_data),
                       .full(full),
                       .empty(empty)
                       );
   initial assume(rst);


   initial begin
      init_1z = 0;
      was_full = 0;
      rd_en_1z = 0;
      rst_1z = 0;
   end
   
   always @(posedge clk) begin
      if (!init_1z) begin
         assume(rst);
      end
      init_1z <= 1'b1;
      rst_1z <= rst;
      rd_en_1z <= rd_en;
      data0_1z <= data[0];
      if (full) begin
        was_full <= 1'b1;
      end
      //make sure we can fill fifo and empty it.
      cover(was_full && empty);
      //make sure we can get full twice
      cover(full && !$past(full) && $past(full,2));
      //assume no one is writing when we're full
      assume(!full || !wr_en);
      //asume no one is reading when we're empty
      assume(!empty || !rd_en);
      //assume no one is writing or reading when we're reset
      assume((!wr_en && !rd_en) || !rst);

      //assert that empty after reset
      assert(empty || !rst_1z);
      //check to see if fifo is working
      assert(rst || rst_1z || !rd_en_1z || data0_1z == dest_data);

      //make sure we progress
      assume(rst || rd_en || wr_en || !init_1z || $past(rst || rd_en || wr_en) || $past(rst || rd_en || wr_en, 2) || $past(rst || rd_en || wr_en, 3) || $past(rst || rd_en || wr_en, 4));
   end

   initial begin
      index = 0;
   end
   integer i;
   
   always @(posedge clk) begin
      if (rst) begin
         index <= 0;
      end else begin
         if (wr_en && rd_en) begin
            for(i = 1; i < 2**ADDR_WIDTH; i=i+1) begin
               if (i < index) begin
                  data[i-1] <= data[i];
               end
            end
            data[index - 1] <= src_data;
         end else if (wr_en) begin
            data[index] <= src_data;
            index <= index + 1;
         end else if (rd_en) begin
            for(i = 1; i < 2**ADDR_WIDTH; i=i+1) begin
               if (i < index) begin
                  data[i-1] <= data[i];
               end
            end
            index <= index - 1;
         end
      end
      assert(index >= 0);
      assert(index <= 2**ADDR_WIDTH);
   end
   
endmodule

module fifo_fwft_tb
  #(parameter depth_width = 4);

   localparam dw = 16;
   localparam FIFO_MAX_BLOCK_SIZE = 128;
   
   vlog_tb_utils vlog_tb_utils0();
   
   
   reg clk = 1'b1;
   reg rst = 1'b1;
   
   always#10 clk <= ~clk;
   initial #100 rst <= 0;

   wire [dw-1:0] wr_data;
   wire 	 wr_en;
   wire [dw-1:0] rd_data;
   wire 	 rd_en;
   wire 	 full;
   wire 	 empty;
   
   fifo_fwft
     #(.DEPTH_WIDTH (depth_width),
       .DATA_WIDTH  (dw))
   dut
     (.clk (clk),
      .rst (rst),

      .din    (wr_data),
      .wr_en   (wr_en & !full),
      .full    (full),
      
      .dout (rd_data),
      .rd_en   (rd_en),
      .empty   (empty));

   fifo_writer
     #(.WIDTH (dw),
       .MAX_BLOCK_SIZE (FIFO_MAX_BLOCK_SIZE))
   writer
     (.clk (clk),
      .dout (wr_data),
      .wren (wr_en),
      .full (full));

   fifo_fwft_reader
     #(.WIDTH (dw),
       .MAX_BLOCK_SIZE (FIFO_MAX_BLOCK_SIZE))
   reader
     (.clk (clk),
      .din  (rd_data),
      .rden (rd_en),
      .empty (empty));
   
   integer 	     i;

   integer 	     tmp;
   integer 	     seed;

   reg [dw*FIFO_MAX_BLOCK_SIZE-1:0] wr_data_block;
   reg [dw*FIFO_MAX_BLOCK_SIZE-1:0] rd_data_block;
   integer 			    length;

   real 			    write_rate;
   real 			    read_rate;
   
   //Stimuli writer
   initial begin
      @(negedge rst);
      @(posedge clk);

      if($value$plusargs("write_rate=%f", write_rate)) begin
	 $display("Setting FIFO write rate to %0f", write_rate);
	 writer.rate=write_rate;
      end

      if($value$plusargs("read_rate=%f", read_rate)) begin
	 $display("Setting FIFO read rate to %0f", read_rate);
	 reader.rate=read_rate;
      end

      reader.timeout=10000;
      
      for(i=0 ; i<FIFO_MAX_BLOCK_SIZE ; i=i+1) begin
	 tmp = $random(seed);
	 wr_data_block[dw*i+:dw] = tmp[dw-1:0];
      end

      length = FIFO_MAX_BLOCK_SIZE;

      writer.write_block(wr_data_block, length);
      $display("Done sending data");
   end
//FIXME : fork/join?
   //Stimuli reader
   initial begin
      @(negedge rst);
      @(posedge clk);

      length = FIFO_MAX_BLOCK_SIZE;
      reader.read_block(rd_data_block, length);
      verify(wr_data_block, rd_data_block);
      if(wr_data_block == rd_data_block)
	$display("Success");
      else
	$display("Error :(");
      $finish;
      
   end

   task verify;
      input [dw*FIFO_MAX_BLOCK_SIZE-1:0] expected_i;
      input [dw*FIFO_MAX_BLOCK_SIZE-1:0] received_i;

      integer 				 idx;
      reg [dw-1:0] 			 expected;
      reg [dw-1:0] 			 received;
      
      begin
	 for(idx=0 ; idx<FIFO_MAX_BLOCK_SIZE ; idx=idx+1) begin
	    expected = expected_i[dw*idx+:dw];
	    received = received_i[dw*idx+:dw];
	    if(expected !==
	       received) begin
	       $display("Error at index %0d. Expected 0x%4x, got 0x%4x", idx, expected, received);
	       //err = 1'b1;
	    end //else $display("0x%8x : 0x%8x", start_addr_i+idx*WSB, received);
	 end
      end
   endtask
endmodule

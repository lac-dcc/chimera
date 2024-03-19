// Language: Verilog 2001


`resetall
`timescale 1ns / 1ps
`default_nettype none


 (* KEEP_HIERARCHY = "YES" *) module parallel_logsoftmax # (
    parameter INPUT_WIDTH = 256,
    parameter DATA_WIDTH = 16,
    parameter ACCUMSIZE = 32,
    parameter MEMSIZE = 1024
)(
    input wire clk,
    input wire rst,

    input wire [INPUT_WIDTH-1:0] pre_softmax_tdata,
    input wire pre_softmax_tvalid,
    input wire pre_softmax_tlast,

    output reg [INPUT_WIDTH-1:0] post_softmax_tdata,
    output reg post_softmax_tvalid,
    output reg post_softmax_tlast
);

   // This code assumes ELEMENTS_PER_VECTOR is 10 for now
   localparam  ELEMENTS_PER_VECTOR = 10;
   localparam  ELEMENTS_PER_INPUT = INPUT_WIDTH / DATA_WIDTH;
   // 8 samples per cycle -> 2 cycles for 10 samples; 16 samples per cycle -> 1 cycle for 10 samples
   localparam  ELEMENTS_PER_CYCLE = (ELEMENTS_PER_INPUT < ELEMENTS_PER_VECTOR ? ELEMENTS_PER_INPUT : ELEMENTS_PER_VECTOR);
   localparam  VECTOR_WIDTH = ELEMENTS_PER_VECTOR * DATA_WIDTH;
   localparam  LOG_10 = 2; // 2.302585092994046, actually int(log(ELEMENTS_PER_VECTOR))

   reg [INPUT_WIDTH-1:0] lower_input_reg; // holds first 8 samples for a cycle to align them with the last 2 samples
   reg [VECTOR_WIDTH-1:0] input_reg;
   reg                    input_reg_tvalid, lower_input_reg_tvalid;

   generate
      if (INPUT_WIDTH >= VECTOR_WIDTH) begin
         always @ (posedge clk) begin
            if (rst) begin
               lower_input_reg <= {INPUT_WIDTH{1'b0}};
               input_reg_tvalid <= 1'b0;
               lower_input_reg_tvalid <= 1'b0;
            end else begin
               if (pre_softmax_tvalid) begin
               input_reg <= pre_softmax_tdata[VECTOR_WIDTH-1:0];
               input_reg_tvalid <= 1'b1;
               end
               else begin
                  input_reg_tvalid <= 1'b0;
               end
            end
         end
      end else begin
	      always @ (posedge clk) begin
            if (rst) begin
               lower_input_reg <= {INPUT_WIDTH{1'b0}};
               input_reg_tvalid <= 1'b0;
               lower_input_reg_tvalid <= 1'b0;
            end else begin
	            if (pre_softmax_tvalid) begin
                  if (!lower_input_reg_tvalid) begin
                     // lower half
                     lower_input_reg <= pre_softmax_tdata;
                     lower_input_reg_tvalid <= 1'b1;
                  end
                  else begin
                     // upper half
                     input_reg[INPUT_WIDTH-1:0] <= lower_input_reg;
                     input_reg[VECTOR_WIDTH-1:INPUT_WIDTH] <= pre_softmax_tdata[VECTOR_WIDTH-INPUT_WIDTH-1:0];
                     input_reg_tvalid <= 1'b1;
                     lower_input_reg_tvalid <= 1'b0;
                     lower_input_reg <= {INPUT_WIDTH{1'b0}};
                  end // else: !if(!lower_input_reg_tvalid)
	            end // if (pre_softmax_tvalid)
	            else begin
		            input_reg_tvalid <= 1'b0;
	            end // else: !if(pre_softmax_tvalid)
	         end // if (!rst)
	      end // always @ (posedge clk)
      end // else: !if(INPUT_WIDTH >= VECTOR_WIDTH)
   endgenerate
   
   // compute max input value
   wire [VECTOR_WIDTH-1:0] input_reg1; // [z_i for z_i in input_reg] delayed by a cycle to match output of parallel_max
   wire [DATA_WIDTH-1:0] max_input_value; // [max(z_i) for z_i in input_reg]
   wire post_max_tvalid;

   parallel_max_and_copy # (
      .VECTOR_WIDTH(VECTOR_WIDTH),
      .DATA_WIDTH(DATA_WIDTH)
   ) pmax_inst (
      .clk(clk),
      .rst(rst),
      .input_tdata(input_reg),
      .input_tvalid(input_reg_tvalid),
      .input_copy_tdata(input_reg),
      .output_copy_tdata(input_reg1),
      .output_max_tdata(max_input_value),
      .output_tvalid(post_max_tvalid)
   );

   reg [VECTOR_WIDTH-1:0] input_reg2; // [z_i for z_i in input_reg] delayed by another cycle
   reg [DATA_WIDTH-1:0] max_input_value2; // [max(z_i) for z_i in input_reg]
   reg [DATA_WIDTH-1:0] prescaler; // 11 - max_input_value2
   reg			input_reg2_tvalid;

   always @(posedge clk) begin
      input_reg2 <= input_reg1;
      max_input_value2 <= max_input_value;
      prescaler <= 11 - max_input_value;
      input_reg2_tvalid <= post_max_tvalid;
      if (post_max_tvalid) begin
	      $display("max_input_value %d prescaler %d", $signed(max_input_value), $signed(11 - max_input_value));
      end
   end

   reg [VECTOR_WIDTH-1:0] input_reg3; // [z_i for z_i in input_reg] delayed by another cycle
   reg [VECTOR_WIDTH-1:0] prescaled_input_reg3; // [z_i + N for z_i in input_reg] delayed by another cycle
   reg [DATA_WIDTH-1:0] max_input_value3; // [max(z_i) for z_i in input_reg]
   reg [DATA_WIDTH-1:0] prescaler3; // 11 - max_input_value2
   reg			input_reg3_tvalid;

   always @(posedge clk) begin
      input_reg3 <= input_reg2;
      max_input_value3 <= max_input_value2;
      prescaler3 <= prescaler;
      input_reg3_tvalid <= input_reg2_tvalid;
   end
   genvar i;
   generate
      for (i = 0; i < ELEMENTS_PER_VECTOR; i = i + 1) begin: prescale
         always @(posedge clk) begin
            prescaled_input_reg3[DATA_WIDTH * i +: DATA_WIDTH] <= input_reg2[DATA_WIDTH * i +: DATA_WIDTH] + prescaler;
         end
      end
   endgenerate

   // assumes parallel_exp has latency 1
   reg [VECTOR_WIDTH-1:0] prescaled_input_reg4; // [z_i + N for z_i in input_reg] delayed by a cycle to match output of parallel_exp
   reg [DATA_WIDTH-1:0]	  prescaler4;
   wire [VECTOR_WIDTH-1:0] post_exp_tdata; // [exp(z_i) for z_i in input_reg]
   wire post_exp_tvalid;

   parallel_exp #(.VECTOR_WIDTH(VECTOR_WIDTH),
                  .DATA_WIDTH(DATA_WIDTH))
       pexp_inst (
                  .clk(clk),
                  .rst(rst),
                  .input_tdata(prescaled_input_reg3),
                  .input_tvalid(input_reg3_tvalid),
                  .output_tdata(post_exp_tdata),
                  .output_tvalid(post_exp_tvalid)
                  );
   // assumes parallel_exp has latency 1
   always @(posedge clk) begin
      prescaled_input_reg4 <= prescaled_input_reg3;
      prescaler4 <= prescaler3;
   end

   // parallel_add_and_copy copies input_reg1 to post_add_tdata with matching latency
   wire [VECTOR_WIDTH-1:0] prescaled_input_reg5; // [z_i + prescaler for z_i in input_reg]
   wire [ACCUMSIZE-1:0] sum_of_exp_of_z; // sum([exp(z_i) for z_i in input_reg])
   wire post_add_tvalid;

   parallel_add_and_copy # (
      .VECTOR_WIDTH(VECTOR_WIDTH),
      .DATA_WIDTH(DATA_WIDTH),
		.ACCUMSIZE(ACCUMSIZE)
   ) psum_inst (
      .clk(clk),
      .rst(rst),
      .input_tdata(post_exp_tdata),
      .input_tvalid(post_exp_tvalid),
      .input_copy_tdata(prescaled_input_reg4),
      .output_copy_tdata(prescaled_input_reg5),
      .output_sum_tdata(sum_of_exp_of_z),
      .output_tvalid(post_add_tvalid)
   );

   wire [DATA_WIDTH-1:0] post_log_value; // log(sum([exp(z_i) for z_i in input_reg]))
   wire post_log_tvalid;

   reg [VECTOR_WIDTH-1:0] prescaled_input_reg6; // [z_i + N for z_i in input_reg]

   // `ifdef VERILATOR
   //    always @(posedge clk) begin
   //       if (post_add_tvalid) begin
 	//          $display("sum_of_exp_of_z: %h", sum_of_exp_of_z);
   //       end
   //    end
   // `endif

   log #(
	 .DATA_WIDTH(ACCUMSIZE)
	 ) log_inst (
		     .clk(clk),
		     .rst(rst),
		     // log assumes input is only DATA_WIDTH
		     .input_tdata(sum_of_exp_of_z),
		     .input_tvalid(post_add_tvalid),
		     .input_tlast(),

		     .output_tdata(post_log_value),
		     .output_tvalid(post_log_tvalid),
		     .output_tlast()
		     );

   // assumes log has latency 1
   always @ (posedge clk) begin
      prescaled_input_reg6 <= prescaled_input_reg5;
      // if (post_log_tvalid) begin
	   //    $display("sum_of_exp_of_z %h truncated %h -> %h", sum_of_exp_of_z, sum_of_exp_of_z[17:0], post_log_value);
      // end
   end

   // the following code delivers the computed vector in two cycles
   // the first 8 elements
   // followed by the final two elements
   reg [INPUT_WIDTH-1:0] upper_output_reg;
   reg upper_output_tvalid;

   always @ (posedge clk) begin
      if (rst) begin
         upper_output_reg <= {INPUT_WIDTH{1'b0}};
      end
   end

   `ifdef VERILATOR
      genvar k;
      for (k = 0; k < ELEMENTS_PER_VECTOR; k = k + 1) begin
         always @ (posedge clk) begin
            if (post_log_tvalid) begin
               $display("%d, %d, %d, %h", post_log_tvalid, upper_output_tvalid, k, prescaled_input_reg6[DATA_WIDTH * k +: DATA_WIDTH]);
            end
         end
      end
      genvar z;
      for (z = 0; z < ELEMENTS_PER_CYCLE; z = z + 1) begin
         always @ (posedge clk) begin
            if (upper_output_tvalid || post_softmax_tvalid) begin
               $display("Result (post_log_tvalid)%d, (upper_output_tvalid)%d, (post_softmax_tvalid)%d, %d, (post_softmax_tdata)%h -> %d", post_log_tvalid, upper_output_tvalid, post_softmax_tvalid, z, post_softmax_tdata[DATA_WIDTH * z +: DATA_WIDTH], $signed(post_softmax_tdata[DATA_WIDTH * z +: DATA_WIDTH]));
            end
         end
      end
   `endif

   generate
      for (i = 0; i < (ELEMENTS_PER_VECTOR - ELEMENTS_PER_CYCLE); i = i + 1) begin
         always @ (posedge clk) begin
            if (upper_output_tvalid) begin
               post_softmax_tdata[DATA_WIDTH * i +: DATA_WIDTH] <= (upper_output_reg[DATA_WIDTH * i +: DATA_WIDTH] - post_log_value);
               upper_output_reg[DATA_WIDTH * i +: DATA_WIDTH] <= 0;
	    end
            else if (post_log_tvalid) begin
               post_softmax_tdata[DATA_WIDTH * i +: DATA_WIDTH] <= (prescaled_input_reg6[DATA_WIDTH * i +: DATA_WIDTH] - post_log_value) + upper_output_reg[DATA_WIDTH * i +: DATA_WIDTH];
               upper_output_reg[DATA_WIDTH * i +: DATA_WIDTH] <= prescaled_input_reg6[DATA_WIDTH * (i + ELEMENTS_PER_CYCLE) +: DATA_WIDTH];
            end
         end
      end
   endgenerate

   genvar j;
   generate
      for (j = (ELEMENTS_PER_VECTOR - ELEMENTS_PER_CYCLE); j < ELEMENTS_PER_CYCLE; j = j + 1) begin
         always @ (posedge clk) begin
            if (post_log_tvalid) begin
               post_softmax_tdata[DATA_WIDTH * j +: DATA_WIDTH] <= prescaled_input_reg6[DATA_WIDTH * j +: DATA_WIDTH] - post_log_value;
            end else begin
               post_softmax_tdata[DATA_WIDTH * j +: DATA_WIDTH] <= 0;
            end
         end
      end
   endgenerate

   always @ (posedge clk) begin
      if (rst || upper_output_tvalid) begin
	      upper_output_tvalid <= 1'b0;
      end
      else if (post_log_tvalid && (ELEMENTS_PER_VECTOR > ELEMENTS_PER_CYCLE)) begin
	      upper_output_tvalid <= 1'b1;
      end
      post_softmax_tvalid <= !rst && (post_log_tvalid || upper_output_tvalid);
   end

endmodule

`resetall

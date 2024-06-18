// This program was cloned from: https://github.com/Asiadav/OpenPBKDF2
// License: MIT License

module kda 
  (input  logic clk_i
  ,input  logic reset_i

  ,input  logic [63:0] data_i  // 2-bit chunks, 6-bit salt_len, 32-bit iters, 512-bit pass, 512-bit salt
  ,input  logic v_i
  ,output logic ready_o

  ,output logic [63:0] data_o  // 32, 64, 96, 128 byte output options
  ,output logic v_o
  ,input  logic yumi_i
);

  logic [1:0] ps, ns;

  logic [1:0] chunks;
  logic [5:0] salt_len;
  logic [31:0] iters;
  logic [511:0] one, pass, salt;
  logic [1023:0] hash;

  logic input_channel_v;
  logic output_channel_yumi;

  logic in_ready, in_valid, out_ready, out_valid;
  logic i_r0, i_r1, i_r2, i_r3;
  logic i_v0, i_v1, i_v2, i_v3;
  logic o_v0, o_v1, o_v2, o_v3;

  assign i_v0 = in_valid;                            // always
  assign i_v1 = in_valid & (chunks[1] | chunks[0]);  // chunks == 2'b11, 2'b10, 2'b01
  assign i_v2 = in_valid & (chunks[1]);              // chunks == 2'b11, 2'b10
  assign i_v3 = in_valid & (chunks[1] & chunks[0]);  // chunks == 2'b11
  
  assign out_valid = o_v0 | o_v1 | o_v2 | o_v3;
  assign in_ready  = i_r0 | i_r1 | i_r2 | i_r3;

  assign in_valid = input_channel_v;

  // control logic
  always @(*) begin
    ns = ps;
    case(ps)
	0: begin  // wait for data from input channel
	  if (input_channel_v) ns = 1;	   
	end
	1: begin  // load data into PBKDF2 chunks
	  if (in_ready) ns = 2;
	end
	2: begin  // wait for computation
	  if (out_valid) ns = 3;
	end
	3: begin  // send data over output channel
	  if (output_channel_yumi) ns = 0;
	end
    endcase
  end

  always @(posedge clk_i) begin
    if (reset_i) begin
      ps <= 0;
    end else begin
      ps <= ns;
    end
  end

  // This feels bad
  always_comb begin
    for (int i = 0; i < 55; i++) begin
      if ((salt_len+4) == i) begin
	one = 1 << 8 * (64 - i); 
      end      
    end
  end

  // pbkdf2 chunks
  pbkdf2 chunk0 (
     .clk_i      (clk_i)
    ,.rst_i      (reset_i)
    ,.salt_len_i (salt_len+6'd4)
    ,.iters_i    (iters)
    ,.pass_i     (pass)
    ,.salt_i     (salt|one)
    ,.in_ready   (i_r0)
    ,.in_valid   (i_v0)
    ,.out_ready  (out_ready)
    ,.out_valid  (o_v0)
    ,.hash_o     (hash[1023:768])
  );

  pbkdf2 chunk1 (
     .clk_i      (clk_i)
    ,.rst_i      (reset_i)
    ,.salt_len_i (salt_len+6'd4)
    ,.iters_i    (iters)
    ,.pass_i     (pass)
    ,.salt_i     (salt|one<<1)
    ,.in_ready   (i_r1)
    ,.in_valid   (i_v1)
    ,.out_ready  (out_ready)
    ,.out_valid  (o_v1)
    ,.hash_o     (hash[767:512])
  );

  pbkdf2 chunk2 (
     .clk_i      (clk_i)
    ,.rst_i      (reset_i)
    ,.salt_len_i (salt_len+6'd4)
    ,.iters_i    (iters)
    ,.pass_i     (pass)
    ,.salt_i     (salt|one|one<<1)
    ,.in_ready   (i_r2)
    ,.in_valid   (i_v2)
    ,.out_ready  (out_ready)
    ,.out_valid  (o_v2)
    ,.hash_o     (hash[511:256])
  );

  pbkdf2 chunk3 (
     .clk_i      (clk_i)
    ,.rst_i      (reset_i)
    ,.salt_len_i (salt_len+6'd4)
    ,.iters_i    (iters)
    ,.pass_i     (pass)
    ,.salt_i     (salt|one<<2)
    ,.in_ready   (i_r3)
    ,.in_valid   (i_v3)
    ,.out_ready  (out_ready)
    ,.out_valid  (o_v3)
    ,.hash_o     (hash[255:0])
  );



  // I/O 
  kda_input_data_channel input_channel (
     .clk_i    (clk_i)
    ,.reset_i  (reset_i)
    ,.data_i   (data_i)
    ,.v_i      (v_i)
    ,.ready_o  (ready_o)
    ,.chunks   (chunks)
    ,.salt_len (salt_len)
    ,.iters    (iters)
    ,.pass     (pass)
    ,.salt     (salt)
    ,.v_o      (input_channel_v)
    ,.ready_i  (in_ready)
  );
  
  kda_output_data_channel output_channel (
     .clk_i   (clk_i)
    ,.reset_i (reset_i)
    ,.data_i  (hash)
    ,.v_i     (out_valid)
    ,.yumi_o  (output_channel_yumi)
    ,.data_o  (data_o)
    ,.v_o     (v_o)
    ,.yumi_i  (yumi_i)
  );

  
endmodule

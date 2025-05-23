// This program was cloned from: https://github.com/NYU-MLDA/OpenABC
// License: BSD 3-Clause "New" or "Revised" License

module bsg_circular_ptr_slots_p16_max_add_p15
(
  clk,
  reset_i,
  add_i,
  o,
  n_o
);

  input [3:0] add_i;
  output [3:0] o;
  output [3:0] n_o;
  input clk;
  input reset_i;
  wire [3:0] o,n_o;
  reg o_3_sv2v_reg,o_2_sv2v_reg,o_1_sv2v_reg,o_0_sv2v_reg;
  assign o[3] = o_3_sv2v_reg;
  assign o[2] = o_2_sv2v_reg;
  assign o[1] = o_1_sv2v_reg;
  assign o[0] = o_0_sv2v_reg;

  always @(posedge clk) begin
    if(reset_i) begin
      o_3_sv2v_reg <= 1'b0;
    end else if(1'b1) begin
      o_3_sv2v_reg <= n_o[3];
    end 
  end


  always @(posedge clk) begin
    if(reset_i) begin
      o_2_sv2v_reg <= 1'b0;
    end else if(1'b1) begin
      o_2_sv2v_reg <= n_o[2];
    end 
  end


  always @(posedge clk) begin
    if(reset_i) begin
      o_1_sv2v_reg <= 1'b0;
    end else if(1'b1) begin
      o_1_sv2v_reg <= n_o[1];
    end 
  end


  always @(posedge clk) begin
    if(reset_i) begin
      o_0_sv2v_reg <= 1'b0;
    end else if(1'b1) begin
      o_0_sv2v_reg <= n_o[0];
    end 
  end

  assign n_o = o + add_i;

endmodule
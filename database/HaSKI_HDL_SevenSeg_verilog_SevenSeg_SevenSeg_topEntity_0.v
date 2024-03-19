// Automatically generated Verilog-2001
module SevenSeg_topEntity_0(outputs_i1
                           ,// clock
                           system1000
                           ,// asynchronous reset: active low
                           system1000_rstn
                           ,bodyVar_o);
  input [127:0] outputs_i1;
  input system1000;
  input system1000_rstn;
  output [11:0] bodyVar_o;
  wire [3:0] x_0;
  wire signed [31:0] repANF_1;
  wire signed [31:0] repANF_2;
  wire signed [31:0] wild_3;
  wire [31:0] bodyVar_4;
  wire [7:0] bodyVar_5;
  wire [1:0] repANF_6;
  wire [1:0] active_7;
  wire signed [31:0] tmp_8;
  wire [31:0] tmp_10;
  wire [1:0] tmp_45;
  SevenSeg_anode_1 SevenSeg_anode_1_x_0
  (.topLet_o (x_0)
  ,.ds1_i1 (active_7));
  
  assign bodyVar_o = {x_0
                     ,bodyVar_5};
  
  assign repANF_1 = wild_3;
  
  assign tmp_8 = $unsigned(active_7);
  
  assign repANF_2 = tmp_8;
  
  assign wild_3 = repANF_2;
  
  // indexVec begin
  wire [31:0] vec_n_11 [0:4-1];
  
  wire [127:0] vecflat_n_12;
  assign vecflat_n_12 = outputs_i1;
  genvar n_13;
  generate
  for (n_13=0; n_13 < 4; n_13=n_13+1) begin : array_n_14
    assign vec_n_11[(4-1)-n_13] = vecflat_n_12[n_13*32+:32];
  end
  endgenerate
  
  assign tmp_10 = vec_n_11[repANF_1];
  // indexVec end
  
  assign bodyVar_4 = tmp_10;
  
  reg [7:0] bodyVar_5_reg;
  always @(*) begin
    case(bodyVar_4)
      32'd104 : bodyVar_5_reg = 8'b11111111 ^ 8'b01110100;
      32'd101 : bodyVar_5_reg = 8'b11111111 ^ 8'b01111011;
      32'd108 : bodyVar_5_reg = 8'b11111111 ^ 8'b00110000;
      32'd111 : bodyVar_5_reg = 8'b11111111 ^ 8'b01011100;
      32'd95 : bodyVar_5_reg = 8'b11111111 ^ 8'b00001000;
      32'd119 : bodyVar_5_reg = 8'b11111111 ^ 8'b00101010;
      32'd114 : bodyVar_5_reg = 8'b11111111 ^ 8'b00110001;
      32'd100 : bodyVar_5_reg = 8'b11111111 ^ 8'b01011110;
      32'd33 : bodyVar_5_reg = 8'b11111111 ^ 8'b10000010;
      default : bodyVar_5_reg = 8'b11111111 ^ 8'b00000000;
    endcase
  end
  assign bodyVar_5 = bodyVar_5_reg;
  
  SevenSeg_next_2 SevenSeg_next_2_repANF_6
  (.topLet_o (repANF_6)
  ,.ds1_i1 (active_7));
  
  // register begin
  reg [1:0] n_47;
  
  always @(posedge system1000 or negedge system1000_rstn) begin : register_SevenSeg_topEntity_0_n_48
    if (~ system1000_rstn) begin
      n_47 <= 2'd0;
    end else begin
      n_47 <= repANF_6;
    end
  end
  
  assign tmp_45 = n_47;
  // register end
  
  assign active_7 = tmp_45;
endmodule

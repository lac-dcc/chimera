// Automatically generated Verilog-2001
module Hardware_cpu_3(ramstatus_i1
                     ,// clock
                     system1000
                     ,// asynchronous reset: active low
                     system1000_rstn
                     ,bodyVar_o);
  input [64:0] ramstatus_i1;
  input system1000;
  input system1000_rstn;
  output [128:0] bodyVar_o;
  wire [666:0] x_0;
  wire [0:0] ww2_1;
  wire [319:0] ww1_2;
  wire [794:0] altLet_3;
  wire [666:0] repANF_4;
  wire [345:0] state_5;
  wire [32:0] x_6;
  wire [94:0] x_7;
  wire [794:0] w_8;
  wire [666:0] state_9;
  wire [0:0] altLet_10;
  wire [0:0] x_11;
  wire [32:0] x_12;
  wire [94:0] x_13;
  wire [29:0] tmp_15;
  wire [666:0] tmp_14;
  assign x_0 = w_8[794:128];
  
  assign ww2_1 = state_9[0:0];
  
  assign ww1_2 = state_9[320:1];
  
  Hardware_step_4 Hardware_step_4_altLet_3
  (.bodyVar_o (altLet_3)
  ,.ww_i1 (state_5)
  ,.ww1_i2 (ww1_2)
  ,.ww2_i3 (ww2_1)
  ,.w_i4 (ramstatus_i1));
  
  assign repANF_4 = x_0;
  
  assign state_5 = state_9[666:321];
  
  assign x_6 = w_8[32:0];
  
  assign x_7 = w_8[127:33];
  
  assign w_8 = altLet_3;
  
  assign tmp_15 = 30'd0;
  
  // register begin
  reg [666:0] n_16;
  
  always @(posedge system1000 or negedge system1000_rstn) begin : register_Hardware_cpu_3_n_17
    if (~ system1000_rstn) begin
      n_16 <= {{2'b00,344'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000},{{2'b01,tmp_15,33'b000000000000000000000000000000000},{2'b00,63'b000000000000000000000000000000000000000000000000000000000000000},{2'b00,93'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000},{2'b00,93'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000}},1'd0};
    end else begin
      n_16 <= repANF_4;
    end
  end
  
  assign tmp_14 = n_16;
  // register end
  
  assign state_9 = tmp_14;
  
  reg [0:0] altLet_10_reg;
  always @(*) begin
    case(state_5[345:344])
      2'b10 : altLet_10_reg = 1'd0;
      default : altLet_10_reg = 1'd1;
    endcase
  end
  assign altLet_10 = altLet_10_reg;
  
  assign x_11 = altLet_10;
  
  assign x_12 = x_6;
  
  assign x_13 = x_7;
  
  assign bodyVar_o = {x_13
                     ,x_12
                     ,x_11};
endmodule

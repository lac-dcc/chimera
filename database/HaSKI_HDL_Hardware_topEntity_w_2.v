// Automatically generated Verilog-2001
module Hardware_topEntity_w_2(// clock
                             system1000
                             ,// asynchronous reset: active low
                             system1000_rstn
                             ,altLet_o);
  input system1000;
  input system1000_rstn;
  output [129:0] altLet_o;
  wire [129:0] altLet_o_sig;
  wire [128:0] x_0;
  wire [95:0] repANF_1;
  wire [32:0] repANF_2;
  wire [0:0] repANF_3;
  wire [95:0] altLet_4;
  wire [95:0] altLet_5;
  wire [94:0] ram_6;
  wire [32:0] out_7;
  wire [0:0] done_8;
  wire [64:0] altLet_9;
  wire [65:0] x_10;
  wire [29:0] repANF_11;
  wire [29:0] repANF_12;
  wire [63:0] repANF_13;
  wire [32:0] altLet_14;
  wire [31:0] ds1_15;
  wire [64:0] bodyVar_16;
  wire [0:0] ds1_17;
  wire [29:0] ptr_18;
  wire [29:0] ptr_19;
  wire [62:0] x_20;
  wire [31:0] o_21;
  wire [64:0] altLet_22;
  wire [64:0] altLet_23;
  wire [0:0] ds2_24;
  wire [95:0] x_25;
  wire [62:0] repANF_26;
  wire [63:0] ds3_27;
  assign altLet_o_sig = {repANF_1
                        ,repANF_2
                        ,repANF_3};
  
  Hardware_cpu_3 Hardware_cpu_3_x_0
  (.bodyVar_o (x_0)
  ,.system1000 (system1000)
  ,.system1000_rstn (system1000_rstn)
  ,.ramstatus_i1 (altLet_9));
  
  reg [95:0] repANF_1_reg;
  always @(*) begin
    case(ram_6[94:93])
      2'b00 : repANF_1_reg = altLet_4;
      2'b01 : repANF_1_reg = altLet_5;
      default : repANF_1_reg = {1'b0
                               ,1'b0
                               ,30'b000000000000000000000000000000
                               ,64'b0000000000000000000000000000000000000000000000000000000000000000};
    endcase
  end
  assign repANF_1 = repANF_1_reg;
  
  reg [32:0] repANF_2_reg;
  always @(*) begin
    case(out_7[32:32])
      1'b0 : repANF_2_reg = {1'b0
                            ,32'd0};
      default : repANF_2_reg = altLet_14;
    endcase
  end
  assign repANF_2 = repANF_2_reg;
  
  reg [0:0] repANF_3_reg;
  always @(*) begin
    case(done_8)
      1'b0 : repANF_3_reg = 1'b1;
      default : repANF_3_reg = 1'b0;
    endcase
  end
  assign repANF_3 = repANF_3_reg;
  
  assign altLet_4 = {1'b1
                    ,1'b0
                    ,repANF_11
                    ,64'b0000000000000000000000000000000000000000000000000000000000000000};
  
  assign altLet_5 = {1'b1
                    ,1'b1
                    ,repANF_12
                    ,repANF_13};
  
  assign ram_6 = x_0[128:34];
  
  assign out_7 = x_0[33:1];
  
  assign done_8 = x_0[0:0];
  
  reg [64:0] altLet_9_reg;
  always @(*) begin
    case(ds1_17)
      1'b0 : altLet_9_reg = {2'b00,63'b000000000000000000000000000000000000000000000000000000000000000};
      default : altLet_9_reg = bodyVar_16;
    endcase
  end
  assign altLet_9 = altLet_9_reg;
  
  Hardware_ram_11 Hardware_ram_11_x_10
  (.bodyVar_o (x_10)
  ,.system1000 (system1000)
  ,.system1000_rstn (system1000_rstn)
  ,.eta_i1 (x_25));
  
  assign repANF_11 = ptr_18;
  
  assign repANF_12 = ptr_19;
  
  Hardware_binarize_13 Hardware_binarize_13_repANF_13
  (.topLet_o (repANF_13)
  ,.ski_i1 (x_20));
  
  assign altLet_14 = {1'b1,o_21};
  
  assign ds1_15 = out_7[31:0];
  
  reg [64:0] bodyVar_16_reg;
  always @(*) begin
    case(ds1_17)
      1'b1 : bodyVar_16_reg = altLet_22;
      default : bodyVar_16_reg = {65 {1'bx}};
    endcase
  end
  assign bodyVar_16 = bodyVar_16_reg;
  
  assign ds1_17 = x_10[65:65];
  
  assign ptr_18 = ram_6[92:63];
  
  assign ptr_19 = ram_6[92:63];
  
  assign x_20 = ram_6[62:0];
  
  assign o_21 = ds1_15;
  
  reg [64:0] altLet_22_reg;
  always @(*) begin
    case(ds2_24)
      1'b0 : altLet_22_reg = altLet_23;
      1'b1 : altLet_22_reg = {2'b10,63'b000000000000000000000000000000000000000000000000000000000000000};
      default : altLet_22_reg = {65 {1'bx}};
    endcase
  end
  assign altLet_22 = altLet_22_reg;
  
  assign altLet_23 = {2'b01,repANF_26};
  
  assign ds2_24 = x_10[64:64];
  
  assign x_25 = altLet_o_sig[129:34];
  
  Hardware_unbinarize_14 Hardware_unbinarize_14_repANF_26
  (.bodyVar_o (repANF_26)
  ,.w_i1 (ds3_27));
  
  assign ds3_27 = x_10[63:0];
  
  assign altLet_o = altLet_o_sig;
endmodule

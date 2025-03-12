// Seed: 3119146967
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  tri  id_6 = id_5 / id_1;
  tri0 id_7 = 1'b0;
endmodule
module module_1 #(
    parameter id_10 = 32'd56,
    parameter id_17 = 32'd11
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    _id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    _id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24
);
  inout wire id_24;
  input wire id_23;
  output wire id_22;
  output wire id_21;
  output wire id_20;
  output wire id_19;
  output wire id_18;
  input wire _id_17;
  inout wire id_16;
  inout wire id_15;
  inout wire id_14;
  output wire id_13;
  output reg id_12;
  output wire id_11;
  input wire _id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  initial begin : LABEL_0
    id_12 <= id_3;
  end
  or primCall (
      id_12,
      id_15,
      id_1,
      id_24,
      id_2,
      id_4,
      id_9,
      id_26,
      id_5,
      id_3,
      id_23,
      id_14,
      id_16,
      id_7,
      id_27
  );
  id_25 :
  assert property (@(posedge 1'd0) -1'h0 + "")
  else $unsigned(32);
  ;
  logic id_26;
  ;
  wire [id_10 : id_17] id_27;
  module_0 modCall_1 (
      id_23,
      id_9,
      id_20,
      id_9,
      id_25
  );
  wire id_28;
  assign id_9 = id_27;
endmodule

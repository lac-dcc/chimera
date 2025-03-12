// Seed: 2979297244
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18
);
  inout wire id_18;
  inout wire id_17;
  output wire id_16;
  output wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_19;
  initial begin : LABEL_0
    id_20(1);
  end
  wire id_21;
  assign id_2 = id_11;
endmodule
module module_1 #(
    parameter id_12 = 32'd60
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
    id_10,
    id_11,
    _id_12
);
  inout wire _id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input logic [7:0] id_2;
  output wire id_1;
  logic id_13;
  ;
  logic [{  -1  ,  1  } : 1 'b0] id_14;
  assign id_4 = 'b0;
  wire id_15;
  ;
  wire ["" : -1] id_16;
  assign id_15 = id_3 ? id_2[id_12] : id_8;
  assign id_11 = id_13;
  module_0 modCall_1 (
      id_1,
      id_13,
      id_13,
      id_15,
      id_9,
      id_13,
      id_16,
      id_5,
      id_13,
      id_14,
      id_15,
      id_14,
      id_16,
      id_14,
      id_4,
      id_13,
      id_15,
      id_14
  );
  wire id_17;
  ;
  wire id_18 = (id_3);
endmodule

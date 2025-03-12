// Seed: 1322463912
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  reg \id_9 ;
  always @(id_2 or negedge \id_9 ) begin : LABEL_0
    \id_9 <= 1;
  end
endmodule
module module_1 #(
    parameter id_13 = 32'd26,
    parameter id_8  = 32'd46
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    _id_13,
    id_14,
    id_15,
    id_16
);
  output wire id_16;
  output wire id_15;
  input wire id_14;
  module_0 modCall_1 (
      id_5,
      id_11,
      id_5,
      id_6,
      id_4,
      id_5,
      id_5,
      id_4
  );
  inout wire _id_13;
  input wire id_12;
  inout wire id_11;
  inout logic [7:0] id_10;
  input logic [7:0] id_9;
  input wire _id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout logic [7:0] id_3;
  output wire id_2;
  output wire id_1;
  assign id_3[""] = 1 ? 1 : id_9[id_13];
  assign id_10[id_8] = id_14;
endmodule

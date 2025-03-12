// Seed: 4097118003
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_5 = id_2;
endmodule
module module_1 #(
    parameter id_1  = 32'd42,
    parameter id_10 = 32'd68,
    parameter id_11 = 32'd28,
    parameter id_2  = 32'd89,
    parameter id_7  = 32'd72
) (
    _id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    _id_10,
    _id_11
);
  inout wire _id_11;
  input wire _id_10;
  inout logic [7:0] id_9;
  inout wire id_8;
  output wire _id_7;
  output wire id_6;
  module_0 modCall_1 (
      id_5,
      id_8,
      id_4,
      id_4,
      id_5,
      id_4
  );
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire _id_2;
  output wire _id_1;
  assign id_9[-1] = id_9 ^ id_2 ^ 1;
  wor [1 : {  id_11  {  1 'h0 }  }] id_12 = -1;
  union {
    logic [id_10 : ~  id_2] id_13;
    logic [id_7 : -1] id_14;
  } [1 'd0 : id_1] id_15;
  ;
  wire id_16;
  wor  id_17 = -1;
endmodule

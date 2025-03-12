// Seed: 1002817433
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
    id_10
);
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout logic [7:0] id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_6[1] = !(id_5 == (id_9));
endmodule
module module_1 #(
    parameter id_19 = 32'd90,
    parameter id_7  = 32'd5,
    parameter id_9  = 32'd39
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    _id_9,
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
  output wire id_18;
  inout wire id_17;
  input wire id_16;
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  inout logic [7:0] id_11;
  inout wire id_10;
  inout wire _id_9;
  inout wire id_8;
  input wire _id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  module_0 modCall_1 (
      id_8,
      id_8,
      id_17,
      id_10,
      id_10,
      id_11,
      id_17,
      id_13,
      id_13,
      id_16
  );
  inout reg id_1;
  wire [id_7 : 1] _id_19;
  always @(posedge {-1, id_11[id_19 :-1], id_17 !=? 1, ""} or posedge 1) id_1 = -1;
  assign id_11[id_9] = 1;
endmodule

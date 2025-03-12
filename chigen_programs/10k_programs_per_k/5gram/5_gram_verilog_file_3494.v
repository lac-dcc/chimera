// Seed: 1111141889
module module_0 #(
    parameter id_3 = 32'd78
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  output logic [7:0] id_4;
  input wire _id_3;
  output wire id_2;
  inout wire id_1;
  assign id_4[id_3&1] = id_7;
  wire id_9;
endmodule
module module_1 #(
    parameter id_7 = 32'd21
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  output wire id_13;
  output wire id_12;
  output supply1 id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire _id_7;
  output wire id_6;
  output logic [7:0] id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_7  = id_8;
  assign id_11 = -1'h0;
  assign id_5  = id_3(1);
  module_0 modCall_1 (
      id_8,
      id_12,
      id_7,
      id_5,
      id_2,
      id_13,
      id_9,
      id_9
  );
  assign id_9 = id_2;
  assign id_5[1] = id_10 == 1;
  supply0 [-1  <=  -1 : id_7  !=  1] id_14 = id_2 ? id_14 : 1 ^ id_3 < !id_3;
  supply1 id_15 = -1;
  assign id_14 = id_7;
  tri0 id_16 = 1'b0;
endmodule

// Seed: 2156393430
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
    id_17
);
  input wire id_17;
  output wire id_16;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  inout supply0 id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_6 = 1;
endmodule
module module_1 #(
    parameter id_1  = 32'd17,
    parameter id_10 = 32'd6
) (
    _id_1,
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
    id_13
);
  output wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire _id_10;
  input wire id_9;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_12,
      id_9,
      id_7,
      id_3,
      id_13,
      id_8,
      id_3,
      id_6,
      id_13,
      id_8,
      id_11,
      id_3,
      id_8,
      id_3,
      id_3
  );
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  and primCall (id_13, id_3, id_9, id_5, id_8, id_4, id_6);
  output wire id_2;
  inout wire _id_1;
  logic [id_10 : id_1] id_14;
  ;
  assign id_11 = id_14;
endmodule

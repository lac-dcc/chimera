// Seed: 1406425905
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
    id_18,
    id_19,
    id_20
);
  output wire id_20;
  input wire id_19;
  inout wire id_18;
  inout wire id_17;
  output wire id_16;
  inout wire id_15;
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_20 = (id_15);
endmodule
module module_1 #(
    parameter id_3 = 32'd5
) (
    id_1,
    id_2,
    _id_3
);
  inout wire _id_3;
  buf primCall (id_2, id_4);
  inout wire id_2;
  output wire id_1;
  logic [id_3 : 1 'b0] id_4 = id_3;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_2,
      id_1,
      id_4,
      id_2,
      id_4,
      id_4,
      id_4,
      id_4,
      id_2,
      id_4,
      id_1,
      id_4,
      id_2,
      id_1,
      id_2,
      id_4,
      id_4,
      id_2
  );
endmodule

// Seed: 1332802858
module module_0 #(
    parameter id_14 = 32'd51,
    parameter id_3  = 32'd37
) (
    id_1,
    id_2,
    _id_3,
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
    _id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20
);
  output wire id_20;
  output wire id_19;
  input wire id_18;
  input wire id_17;
  output wire id_16;
  output wire id_15;
  output wire _id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire _id_3;
  inout wire id_2;
  inout wire id_1;
  union packed {logic [id_14 : id_3] id_21;} id_22, id_23, id_24;
endmodule
module module_1 #(
    parameter id_2 = 32'd67
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire _id_2;
  inout wire id_1;
  assign id_2 = id_3;
  wire id_6[id_2 : 1];
  ;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_2,
      id_6,
      id_1,
      id_4,
      id_4,
      id_6,
      id_3,
      id_6,
      id_6,
      id_1,
      id_3,
      id_2,
      id_5,
      id_5,
      id_1,
      id_4,
      id_3,
      id_1
  );
  wire id_7;
  assign id_1 = id_6;
  wire [-1  -  1 : 1] id_8;
endmodule

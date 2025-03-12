// Seed: 1019427052
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    .id_11(id_7),
    id_8,
    id_9,
    id_10
);
  input wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = id_10;
endmodule
module module_1 #(
    parameter id_12 = 32'd20,
    parameter id_9  = 32'd14
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    id_10,
    id_11,
    _id_12,
    id_13,
    id_14
);
  input wire id_14;
  output wire id_13;
  output wire _id_12;
  input wire id_11;
  input wire id_10;
  input wire _id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  module_0 modCall_1 (
      id_7,
      id_3,
      id_7,
      id_4,
      id_5,
      id_13,
      id_4,
      id_7,
      id_10,
      id_7
  );
  output wire id_1;
  and primCall (id_1, id_7, id_6, id_10, id_11, id_14, id_8, id_3, id_4, id_5, id_2);
  logic [id_12 : id_9] id_15;
  ;
endmodule

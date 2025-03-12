// Seed: 1124093126
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
    id_13
);
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_14;
endmodule
module module_1 #(
    parameter id_2 = 32'd22
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire _id_2;
  module_0 modCall_1 (
      id_5,
      id_3,
      id_8,
      id_5,
      id_5,
      id_1,
      id_3,
      id_3,
      id_3,
      id_3,
      id_5,
      id_3,
      id_3
  );
  output wire id_1;
  struct packed {
    logic [id_2 : 1] id_9;
    id_10 id_11;
  } [-1 : 1] id_12;
  ;
  assign id_12.id_10 = id_5;
endmodule

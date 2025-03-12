// Seed: 3156310936
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
    id_11
);
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  logic id_12;
  ;
  wire id_13;
endmodule
module module_1 #(
    parameter id_7 = 32'd39,
    parameter id_8 = 32'd66
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    _id_8,
    id_9,
    id_10
);
  inout wire id_10;
  inout wire id_9;
  inout wire _id_8;
  inout wire _id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  module_0 modCall_1 (
      id_9,
      id_5,
      id_5,
      id_1,
      id_6,
      id_4,
      id_5,
      id_6,
      id_3,
      id_1,
      id_1
  );
  inout wire id_1;
  wire id_11;
  union packed {
    union packed {logic id_12;} id_13;
    struct packed {logic id_14;} [id_8 : id_7] id_15;
    logic id_16;
  } id_17 = {1} & 1;
  assign {-1, id_17.id_12, 1'b0 - -1} = 1;
endmodule

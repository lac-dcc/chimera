// Seed: 260708526
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
    id_15
);
  input wire id_15;
  input wire id_14;
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  assign module_1.id_0 = 0;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  logic id_16 = 1 * 1 - 1;
  wire  id_17;
endmodule
module module_1 #(
    parameter id_0 = 32'd7
) (
    output wor _id_0,
    input wor id_1,
    input supply0 id_2,
    input tri1 id_3,
    output supply1 id_4,
    output tri0 id_5
);
  struct packed {
    logic [-1 : id_0] id_7;
    struct packed {
      logic [-1 : id_0] id_8;
      logic id_9;
    } [id_0 : -1] id_10;
  } [-1 : -1] id_11;
  or primCall (id_4, id_3, id_2, id_8, id_7, id_1, id_10);
  module_0 modCall_1 (
      id_11,
      id_11,
      id_10,
      id_9,
      id_9,
      id_8,
      id_7,
      id_10,
      id_11,
      id_10,
      id_10,
      id_7,
      id_11,
      id_10,
      id_9
  );
endmodule

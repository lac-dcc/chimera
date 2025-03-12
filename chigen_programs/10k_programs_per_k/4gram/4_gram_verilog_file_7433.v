// Seed: 396287458
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
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  final $unsigned(56);
  ;
  wire  id_11;
  wire  id_12;
  logic id_13;
  wire  id_14;
  wire id_15, id_16;
endmodule
module module_1 (
    input supply0 id_0
    , id_9,
    input supply1 id_1,
    input tri0 id_2,
    input supply1 id_3
    , id_10,
    input tri0 id_4,
    output tri0 id_5,
    input tri1 id_6,
    input tri0 id_7
);
  localparam id_11 = 1;
  nor primCall (id_5, id_7, id_0, id_11, id_4, id_3, id_1, id_2, id_9, id_6);
  module_0 modCall_1 (
      id_11,
      id_11,
      id_11,
      id_9,
      id_9,
      id_11,
      id_10,
      id_9,
      id_10,
      id_10
  );
endmodule

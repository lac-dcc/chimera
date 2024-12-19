// Seed: 3499209797
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_10;
endmodule
module module_1 (
    input tri0 id_0,
    input tri id_1,
    output wor id_2
    , id_19,
    input supply0 id_3,
    input wor id_4,
    input supply1 id_5,
    output tri1 id_6,
    input tri0 id_7,
    input tri0 id_8,
    input wire id_9,
    input supply1 id_10,
    input supply1 id_11,
    input supply0 id_12,
    input supply0 id_13,
    output wor id_14,
    input wor id_15,
    output wire id_16,
    input uwire id_17
);
  logic [7:0] id_20;
  wire id_21, id_22;
  module_0 modCall_1 (
      id_22,
      id_21,
      id_22,
      id_19,
      id_21,
      id_21,
      id_22,
      id_19,
      id_19
  );
  wor id_23 = 1;
  assign id_20[1] = 1'h0 || (id_9) || 1;
  nand primCall (
      id_2,
      id_12,
      id_8,
      id_10,
      id_0,
      id_3,
      id_11,
      id_5,
      id_15,
      id_20,
      id_21,
      id_1,
      id_13,
      id_4,
      id_9,
      id_22
  );
endmodule

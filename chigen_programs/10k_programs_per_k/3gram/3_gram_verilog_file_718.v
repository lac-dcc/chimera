// Seed: 3876897261
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  logic [7:0] id_3;
  assign id_3[1] = id_1 & id_2;
  wire id_4;
  wire id_5, id_6, id_7, id_8, id_9, id_10, id_11, id_12, id_13, id_14, id_15, id_16;
  wire id_17;
endmodule
module module_1 (
    output tri0  id_0,
    input  uwire id_1,
    input  tri0  id_2,
    output wire  id_3,
    input  uwire id_4,
    input  tri0  id_5,
    input  tri1  id_6,
    input  tri0  id_7,
    input  tri   id_8,
    output wire  id_9,
    input  tri   id_10,
    input  tri0  id_11,
    output wand  id_12,
    input  logic id_13,
    output tri0  id_14,
    input  tri1  id_15,
    input  wand  id_16,
    input  tri0  id_17,
    output uwire id_18,
    output wire  id_19,
    output uwire id_20,
    output logic id_21,
    output uwire id_22,
    output wor   id_23
);
  always
    if (1) begin : LABEL_0
      id_21 <= id_13;
      id_21 = 1;
    end
  or primCall (
      id_18, id_8, id_17, id_1, id_4, id_26, id_5, id_13, id_16, id_7, id_11, id_15, id_25
  );
  wire id_25;
  wire id_26;
  module_0 modCall_1 (
      id_25,
      id_26
  );
  wire id_27;
endmodule

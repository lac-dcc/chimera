// Seed: 292017023
module module_0 (
    input  wire  id_0,
    output tri   id_1,
    input  tri   id_2,
    output uwire id_3,
    input  wor   id_4,
    input  wor   id_5,
    input  tri   id_6,
    output uwire id_7,
    output wand  id_8,
    output wire  id_9,
    input  tri1  id_10,
    input  tri0  id_11,
    input  wire  id_12,
    output tri   id_13,
    output tri0  id_14,
    input  tri   id_15,
    input  uwire id_16
);
  assign id_3 = id_8++;
  wire id_18, id_19, id_20, id_21, id_22, id_23, id_24, id_25, id_26;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    input uwire id_0,
    input tri id_1,
    output wor id_2,
    input supply1 id_3
);
  wire id_5;
  tri  id_6 = id_0;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_0,
      id_6,
      id_0,
      id_3,
      id_3,
      id_6,
      id_2,
      id_6,
      id_6,
      id_1,
      id_1,
      id_2,
      id_6,
      id_0,
      id_0
  );
  always @(posedge (1)) id_6 = (1) > id_0 | id_0;
  assign id_2 = 1'b0 << 1;
  tri0 id_7 = 1;
endmodule

// Seed: 387513628
module module_0 (
    input wire id_0,
    output wor id_1,
    output uwire id_2,
    output uwire id_3,
    input wire id_4,
    input supply0 id_5,
    output supply1 id_6,
    output wand id_7,
    input wire id_8,
    output tri1 id_9,
    input tri1 id_10,
    input tri1 id_11,
    input tri id_12,
    output tri0 id_13,
    output supply0 id_14
);
  wire id_16;
  wand id_17 = 1 >= id_0;
  assign module_1.id_13 = 0;
endmodule
module module_1 (
    output logic id_0,
    output wand id_1,
    input supply1 id_2,
    input uwire id_3,
    output wor id_4,
    input wire id_5,
    input uwire id_6,
    input wor id_7,
    input supply0 id_8,
    input uwire id_9,
    input logic id_10,
    output supply0 id_11,
    output tri id_12,
    output supply1 id_13
);
  assign id_4 = (id_8);
  module_0 modCall_1 (
      id_8,
      id_4,
      id_12,
      id_12,
      id_5,
      id_9,
      id_13,
      id_13,
      id_9,
      id_1,
      id_5,
      id_3,
      id_9,
      id_13,
      id_11
  );
  always @(posedge id_7) if (1'b0) id_0 <= id_10;
  logic id_15;
  assign id_15 = id_10;
endmodule

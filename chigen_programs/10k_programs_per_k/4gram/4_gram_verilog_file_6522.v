// Seed: 647550207
module module_0 (
    input uwire id_0,
    input uwire id_1,
    input tri id_2,
    output wand id_3,
    output wire id_4,
    output logic id_5,
    input uwire id_6,
    input tri1 id_7,
    output wor id_8,
    input tri0 id_9,
    output uwire id_10,
    output uwire id_11
    , id_19,
    input wire id_12,
    input wand id_13,
    input supply1 id_14,
    input supply1 id_15,
    input supply1 id_16,
    output uwire id_17
);
  always_comb @(posedge 1 or posedge id_0) id_5 = -1;
  wire id_20;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    output logic id_0,
    input supply0 id_1,
    output tri1 id_2,
    input wand id_3,
    input uwire id_4,
    output tri0 id_5
);
  always @(negedge (id_4 ==? 1)) id_0 = 1'b0;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_3,
      id_5,
      id_2,
      id_0,
      id_4,
      id_4,
      id_2,
      id_1,
      id_5,
      id_2,
      id_1,
      id_3,
      id_3,
      id_4,
      id_4,
      id_2
  );
endmodule

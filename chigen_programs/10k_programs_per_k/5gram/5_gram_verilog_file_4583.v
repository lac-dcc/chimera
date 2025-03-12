// Seed: 3891101282
module module_0 (
    input tri1 id_0,
    input uwire id_1,
    input supply1 id_2,
    input wire id_3,
    input supply1 id_4,
    output wor id_5
);
  logic id_7;
  assign module_1.id_11 = 0;
endmodule
module module_1 (
    output wire id_0,
    input wire id_1,
    input supply0 id_2,
    input supply1 id_3,
    output logic id_4,
    input wand id_5,
    input tri id_6,
    input supply0 id_7,
    input wand id_8,
    output supply0 id_9,
    output wand id_10,
    input uwire id_11
);
  wire id_13, id_14;
  module_0 modCall_1 (
      id_8,
      id_8,
      id_6,
      id_7,
      id_5,
      id_9
  );
  always @(negedge id_2 ^ id_7, id_14 or posedge -1) id_4 = -1;
endmodule

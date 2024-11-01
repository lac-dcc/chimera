// Seed: 1029531972
module module_0 (
    output wand id_0,
    input wand id_1,
    input supply1 id_2,
    output supply0 id_3,
    input tri1 id_4,
    output wire id_5,
    input wor id_6,
    output wire id_7,
    output tri0 id_8,
    input uwire id_9,
    input wand id_10,
    input wand id_11,
    input tri id_12,
    input tri0 id_13,
    output wire id_14,
    output wor id_15
);
  assign id_14 = id_13 == id_4;
endmodule
module module_1 (
    output supply0 id_0,
    input wire id_1,
    output wand id_2,
    input logic id_3,
    output uwire id_4,
    output logic id_5
);
  always_ff @(negedge ~id_1 == id_3 - 1 or posedge (id_1)) id_5 <= id_3;
  module_0(
      id_2, id_1, id_1, id_4, id_1, id_2, id_1, id_4, id_2, id_1, id_1, id_1, id_1, id_1, id_4, id_4
  );
endmodule

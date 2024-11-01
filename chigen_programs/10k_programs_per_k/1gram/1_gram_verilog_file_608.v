// Seed: 3196210918
module module_0 (
    output wand id_0,
    output tri1 id_1
);
endmodule
module module_1 (
    input uwire id_0,
    output logic id_1,
    input wor id_2,
    input wand id_3,
    output supply0 id_4,
    input tri1 id_5,
    output tri0 id_6,
    input tri id_7,
    input uwire id_8,
    input wire id_9,
    output uwire id_10,
    input supply1 id_11,
    input tri1 id_12,
    input supply1 id_13,
    input tri1 id_14,
    input wire id_15,
    input wire id_16
);
  id_18 :
  assert property (@(posedge 1) id_16) id_1 <= id_8 - 1;
  nand (id_10, id_8, id_14, id_0, id_13, id_18, id_5, id_7, id_3);
  module_0(
      id_4, id_10
  );
endmodule

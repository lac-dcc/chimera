// Seed: 43947492
module module_0 (
    input wand id_0,
    input wor id_1,
    output tri1 id_2,
    input wor id_3,
    output wor id_4,
    output wire id_5,
    input tri1 id_6,
    input tri1 id_7,
    input supply0 id_8,
    input tri1 id_9
);
  wire id_11 = id_8, id_12;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input tri id_0,
    input tri id_1,
    input wor id_2,
    input supply0 id_3,
    inout logic id_4,
    input uwire id_5,
    input wand id_6,
    output uwire id_7,
    input wor id_8,
    input uwire id_9,
    input uwire id_10,
    output tri id_11
);
  always @(posedge id_6) id_4 <= #1 id_5 - 1 * id_4;
  xor primCall (id_7, id_1, id_10, id_2, id_9, id_4, id_5, id_6, id_3);
  module_0 modCall_1 (
      id_10,
      id_10,
      id_11,
      id_5,
      id_11,
      id_11,
      id_5,
      id_9,
      id_1,
      id_0
  );
endmodule

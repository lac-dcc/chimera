// Seed: 314585479
module module_0 (
    input supply1 id_0,
    input tri id_1,
    output tri id_2,
    input supply1 id_3,
    output uwire id_4
);
  assign #id_6 id_2 = 1;
endmodule
module module_1 (
    output supply1 id_0,
    input wor id_1,
    input wand id_2,
    output wor id_3,
    input wor id_4,
    output logic id_5,
    input uwire id_6,
    input supply1 id_7,
    input supply1 id_8,
    output tri0 id_9,
    input wor id_10,
    output tri0 id_11
);
  always_latch #1 id_5 <= 1 + 1'b0 - (1'b0) == id_6;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_9,
      id_8,
      id_0
  );
  assign modCall_1.id_3 = 0;
  xor primCall (id_0, id_2, id_7, id_10, id_4, id_8);
endmodule

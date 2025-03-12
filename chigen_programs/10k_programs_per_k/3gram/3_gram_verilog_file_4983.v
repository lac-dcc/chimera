// Seed: 3692702920
module module_0 (
    input supply1 id_0,
    input wand id_1
);
endmodule
macromodule module_1 (
    input tri1 id_0,
    output tri1 id_1,
    input supply1 id_2,
    output wor id_3,
    output logic id_4
);
  assign id_1 = -1;
  always @(-1) id_4 <= -1'b0 == 1'b0;
  module_0 modCall_1 (
      id_0,
      id_2
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    input wand id_0,
    input supply1 id_1,
    input supply0 id_2,
    output wor id_3,
    output tri1 id_4
);
  wire id_6;
  bufif0 primCall (id_4, id_2, id_1);
  module_0 modCall_1 (
      id_2,
      id_0
  );
  assign modCall_1.id_0 = 0;
endmodule

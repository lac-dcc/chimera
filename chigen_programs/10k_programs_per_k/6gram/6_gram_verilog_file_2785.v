// Seed: 81233182
module module_0 (
    output tri1 id_0,
    input supply1 id_1,
    input wire id_2,
    input tri id_3,
    input wand id_4,
    input wor id_5,
    input tri1 id_6,
    output supply1 id_7,
    output tri0 id_8,
    input supply0 id_9,
    output wire id_10
);
  assign id_7 = 1 ? 1 == 1'b0 : id_9 == 1;
  assign module_1.type_4 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input supply0 id_1,
    input wor id_2,
    input wor id_3,
    output tri id_4,
    output tri0 id_5
);
  assign id_4 = 1;
  nor primCall (id_5, id_3, id_1, id_0, id_2);
  module_0 modCall_1 (
      id_4,
      id_0,
      id_2,
      id_1,
      id_0,
      id_3,
      id_3,
      id_4,
      id_5,
      id_1,
      id_5
  );
endmodule

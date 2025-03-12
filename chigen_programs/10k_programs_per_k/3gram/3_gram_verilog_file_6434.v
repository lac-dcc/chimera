// Seed: 1212504539
module module_0 (
    input tri0 id_0,
    input wor id_1,
    input supply1 id_2,
    output uwire id_3,
    input wand id_4,
    input tri1 id_5,
    output supply0 id_6,
    output tri0 id_7
);
  always @(negedge 1) if (1) assign id_3 = 1;
endmodule
module module_1 (
    input tri1 id_0,
    input wor id_1,
    output tri id_2,
    input tri id_3,
    output wand id_4,
    output supply1 id_5
);
  assign id_4 = 1;
  localparam id_7 = 1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_0,
      id_2,
      id_3,
      id_0,
      id_5,
      id_4
  );
  assign modCall_1.id_0 = 0;
endmodule

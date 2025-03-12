// Seed: 3072673755
module module_0 (
    output wor id_0,
    input wire id_1,
    input wor id_2,
    input wand id_3,
    input supply1 id_4,
    input tri0 id_5,
    output tri0 id_6
);
  wire id_8;
endmodule
module module_1 (
    output logic id_0,
    output uwire id_1,
    output wire id_2,
    output uwire id_3,
    output tri1 id_4,
    input wand id_5,
    input supply1 id_6
);
  module_0 modCall_1 (
      id_3,
      id_5,
      id_6,
      id_5,
      id_5,
      id_5,
      id_1
  );
  assign modCall_1.id_4 = 0;
  always @(-1 + 1'b0 or id_6) id_0 <= id_6;
endmodule

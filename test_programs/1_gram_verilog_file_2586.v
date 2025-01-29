// Seed: 516925941
module module_0 (
    input tri1 id_0,
    input wor id_1,
    output tri0 id_2,
    output wand id_3,
    output supply1 id_4,
    input supply1 id_5,
    input tri id_6,
    output tri0 id_7,
    output uwire id_8,
    output wand id_9,
    input tri1 id_10,
    input wire id_11
);
  assign id_9 = -1;
  always @(1'h0 or(id_1 >= 1 + id_5 ? id_5 * 1 - 1'b0 : 1) or negedge id_5) id_2 = id_6;
endmodule
module module_1 (
    input supply1 id_0,
    input tri0 id_1,
    output wand id_2,
    input wor id_3,
    input supply0 id_4
);
  localparam id_6 = 1;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_2,
      id_2,
      id_2,
      id_3,
      id_4,
      id_2,
      id_2,
      id_2,
      id_4,
      id_1
  );
  assign modCall_1.id_6 = 0;
  wire id_7, id_8;
  final id_2 = 1'h0;
endmodule

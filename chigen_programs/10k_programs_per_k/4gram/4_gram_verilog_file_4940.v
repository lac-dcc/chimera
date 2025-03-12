// Seed: 953930715
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    input tri id_2,
    input wand id_3,
    input supply0 id_4,
    input tri1 id_5,
    output wand id_6,
    input wire id_7
);
  parameter id_9 = 1'b0;
  assign id_6 = id_1 ? 1'd0 : 1'h0;
endmodule
module module_1 (
    output tri1 id_0,
    output wor id_1,
    output wand id_2,
    input supply0 id_3,
    input tri0 id_4,
    input wand id_5,
    output wire id_6,
    input tri0 id_7,
    input supply1 id_8,
    input tri1 id_9
);
  module_0 modCall_1 (
      id_7,
      id_8,
      id_5,
      id_9,
      id_5,
      id_8,
      id_1,
      id_5
  );
  assign modCall_1.id_4 = 0;
  wire id_11;
endmodule

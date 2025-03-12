// Seed: 1980462585
module module_0 (
    input supply1 id_0,
    input wor id_1,
    output wor id_2,
    output tri1 id_3,
    input uwire id_4,
    output wor id_5
);
endmodule
module module_1 (
    input wand id_0,
    input wire id_1,
    input wor id_2,
    input wand id_3,
    input tri0 id_4,
    input wand id_5,
    input tri1 id_6,
    output supply0 id_7
);
  assign id_7 = ~id_2;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_7,
      id_7,
      id_6,
      id_7
  );
  assign modCall_1.id_4 = 0;
  assign id_7 = 1'b0;
  wire id_9;
  assign id_7 = id_1 == id_2;
endmodule

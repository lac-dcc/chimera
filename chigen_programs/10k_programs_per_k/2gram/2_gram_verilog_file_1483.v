// Seed: 2406338604
module module_0 (
    input wand id_0,
    input wire id_1,
    input wor id_2,
    output tri id_3,
    input uwire id_4,
    input uwire id_5,
    output wor id_6,
    input wor id_7,
    input supply0 id_8,
    input supply1 id_9
);
  assign id_6 = id_2;
  initial begin : LABEL_0
    force id_6 = id_2 - id_4;
  end
  wire id_11;
endmodule
module module_1 (
    output wire id_0,
    output wand id_1,
    input supply1 id_2,
    output wand id_3
);
  pullup (id_3, 1'd0);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.id_1 = 0;
  wire id_5;
endmodule

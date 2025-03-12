// Seed: 2409904749
module module_0 (
    input supply0 id_0,
    input wor id_1,
    output wand id_2
    , id_11,
    input uwire id_3,
    input tri0 id_4,
    output wand id_5,
    input supply0 id_6,
    input wire id_7,
    input supply1 id_8,
    output uwire id_9
);
  specify
    (id_12 => id_13) = 1;
  endspecify
endmodule
module module_1 (
    output tri1 id_0,
    input uwire id_1,
    input supply0 id_2,
    output wand id_3,
    input tri id_4,
    inout supply1 id_5,
    output wand id_6
);
  logic id_8;
  nor primCall (id_3, id_5, id_1, id_2, id_8, id_4);
  assign id_0 = -1;
  assign id_5 = id_8;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_1,
      id_4,
      id_6,
      id_5,
      id_5,
      id_4,
      id_3
  );
  assign modCall_1.id_2 = 0;
endmodule

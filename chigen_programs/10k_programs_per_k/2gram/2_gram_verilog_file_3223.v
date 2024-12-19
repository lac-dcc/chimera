// Seed: 297529047
module module_0 (
    output wire id_0,
    output wire id_1,
    input tri1 id_2,
    input tri id_3,
    input tri1 id_4,
    output tri0 id_5,
    output supply1 id_6,
    output wire id_7,
    output tri id_8,
    input tri0 id_9,
    input tri id_10
    , id_15,
    input supply1 id_11,
    input tri id_12,
    input uwire id_13
);
  assign id_1 = id_15;
endmodule
module module_1 (
    input supply0 id_0,
    output wand id_1,
    input supply1 id_2,
    output supply0 id_3,
    input supply1 id_4,
    output wor id_5,
    output supply1 id_6,
    output tri id_7
);
  wire id_9;
  wire id_10;
  nor primCall (id_1, id_2, id_0, id_9, id_10, id_4);
  module_0 modCall_1 (
      id_6,
      id_5,
      id_4,
      id_4,
      id_4,
      id_5,
      id_6,
      id_1,
      id_1,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.id_15 = 0;
  assign id_1 = 1;
  id_11(
      .id_0(1), .id_1(1), .id_2((id_0))
  );
endmodule

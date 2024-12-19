// Seed: 1150965956
module module_0 (
    input supply1 id_0,
    input wand id_1,
    output tri1 id_2,
    input uwire id_3,
    output wand id_4,
    output tri1 module_0,
    input wor id_6,
    output uwire id_7,
    output wor id_8,
    input supply0 id_9,
    input wand id_10,
    input wor id_11
);
  assign id_4 = 1;
  wire id_13;
  wire id_14;
endmodule
module module_1 (
    input tri id_0,
    output supply1 id_1,
    input supply1 id_2,
    output uwire id_3
);
  wand id_5;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_3,
      id_0,
      id_3,
      id_1,
      id_0,
      id_1,
      id_3,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.id_4 = 0;
  assign id_3 = id_0#(
      .id_2(id_5 - 1'b0),
      .id_0(1),
      .id_2(1'b0)
  );
  assign id_3 = 1'b0;
endmodule

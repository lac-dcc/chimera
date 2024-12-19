// Seed: 88748033
module module_0 (
    input wand id_0,
    output uwire id_1,
    input uwire id_2,
    input wand id_3,
    output wire id_4,
    input tri id_5,
    input uwire id_6,
    output supply1 id_7,
    output supply1 id_8,
    input tri id_9,
    output uwire id_10
);
  tri0 id_12;
  id_13(
      .id_0(id_2)
  );
  assign module_1.type_2 = 0;
  assign id_12 = 1;
endmodule
module module_1 (
    output wire  id_0,
    output wand  id_1,
    input  uwire id_2,
    output uwire id_3,
    output tri0  id_4
);
  assign id_3 = 1;
  wire id_6;
  wor  id_7;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_2,
      id_2,
      id_3,
      id_2,
      id_2,
      id_1,
      id_0,
      id_2,
      id_3
  );
  always #1 id_7 = 1;
endmodule

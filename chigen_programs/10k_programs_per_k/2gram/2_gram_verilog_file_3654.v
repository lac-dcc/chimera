// Seed: 1914888167
module module_0 (
    output supply1 id_0,
    input tri id_1,
    input supply0 id_2,
    input uwire id_3,
    input supply0 id_4,
    input tri id_5,
    output supply1 id_6,
    output uwire id_7,
    input wand id_8
    , id_14,
    output tri0 id_9,
    input tri0 id_10,
    input supply0 id_11,
    input wor id_12
);
  id_15(
      .id_0(1)
  );
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    input supply0 id_1,
    output wand id_2,
    input supply1 id_3,
    output logic id_4,
    input tri1 id_5,
    inout wor id_6,
    output wire id_7,
    output tri0 id_8
);
  tri1 id_10;
  assign id_7 = 1;
  assign id_0 = id_10;
  module_0 modCall_1 (
      id_10,
      id_5,
      id_1,
      id_1,
      id_5,
      id_5,
      id_6,
      id_10,
      id_10,
      id_8,
      id_1,
      id_3,
      id_5
  );
  if ((id_6)) initial id_4 <= 1;
  else tri0 id_11 = id_3;
endmodule

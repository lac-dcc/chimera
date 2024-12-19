// Seed: 2808231278
module module_0 (
    input supply1 id_0,
    input tri0 id_1,
    output tri0 id_2,
    output tri id_3,
    input tri1 id_4,
    output tri0 id_5
);
  assign module_1.type_4 = 0;
  uwire id_7;
  wire  id_8;
  assign id_7 = 1;
  supply0 id_9;
  assign id_5 = id_0;
  assign id_9 = id_4;
  wire id_10;
endmodule
module module_1 (
    output logic id_0,
    input supply0 id_1,
    input supply1 id_2,
    input supply1 id_3,
    input wand id_4,
    input supply1 id_5,
    output supply0 id_6,
    input tri id_7,
    output wor id_8
);
  always #(id_2)
    if (id_5) id_0 <= 1;
    else id_6 = id_7;
  assign id_6 = id_5;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_8,
      id_8,
      id_5,
      id_8
  );
  wire id_10;
endmodule

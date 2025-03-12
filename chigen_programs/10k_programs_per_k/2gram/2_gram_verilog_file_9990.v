// Seed: 2935155727
module module_0 (
    output tri1 id_0,
    input supply0 id_1,
    output wor id_2,
    input supply0 id_3,
    input tri0 id_4,
    input supply0 id_5,
    output wor id_6,
    output uwire id_7,
    input tri1 id_8
);
  wire [-1 : -1] id_10;
  wire [-1 'b0 : -1] id_11;
  assign id_2 = 1;
  logic id_12;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    output wand id_1,
    input  tri0 id_2,
    input  wand id_3,
    output tri1 id_4,
    output tri1 id_5,
    input  wor  id_6
);
  module_0 modCall_1 (
      id_0,
      id_2,
      id_5,
      id_2,
      id_3,
      id_3,
      id_1,
      id_1,
      id_2
  );
  assign id_0 = id_3;
endmodule

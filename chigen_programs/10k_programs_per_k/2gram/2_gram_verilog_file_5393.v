// Seed: 2344678947
module module_0 (
    input tri0 id_0,
    input wire id_1,
    input wire id_2,
    output supply1 id_3,
    input supply0 id_4,
    input supply1 id_5,
    output tri0 id_6,
    output tri0 id_7,
    output wor id_8,
    output wand id_9,
    input supply0 id_10,
    input wand id_11
);
  wire id_13;
  assign id_3 = 1;
  wire id_14;
  wire id_15;
  assign module_1.id_8 = 0;
endmodule
module module_1 (
    output wire id_0,
    input supply0 id_1,
    output uwire id_2,
    input wor id_3,
    input supply1 id_4,
    input tri1 id_5,
    output wor id_6,
    input wire id_7,
    output tri id_8
);
  tri1 id_10;
  module_0 modCall_1 (
      id_10,
      id_5,
      id_4,
      id_8,
      id_4,
      id_5,
      id_6,
      id_10,
      id_10,
      id_8,
      id_1,
      id_4
  );
  always begin : LABEL_0
    id_10 = id_7;
  end
  assign id_2 = id_10;
endmodule

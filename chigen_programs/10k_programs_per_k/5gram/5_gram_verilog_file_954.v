// Seed: 4262714251
module module_0 (
    output supply1 id_0,
    input supply0 id_1,
    input tri1 id_2,
    input wire id_3,
    output supply1 id_4,
    input supply0 id_5,
    input wor id_6,
    output tri1 id_7,
    output uwire id_8,
    output wire id_9,
    input wand id_10,
    input supply1 id_11,
    input wand id_12,
    output tri id_13,
    output uwire id_14
);
  wire id_16;
  assign id_4 = id_10;
  supply1 id_17, id_18 = id_12;
  wire id_19;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input  tri1  id_0,
    input  tri1  id_1,
    output tri   id_2,
    input  tri0  id_3,
    input  wor   id_4,
    input  tri   id_5,
    input  tri   id_6,
    output uwire id_7
);
  assign id_7 = 1;
  wire id_9 = 1;
  module_0 modCall_1 (
      id_7,
      id_1,
      id_1,
      id_0,
      id_7,
      id_3,
      id_6,
      id_2,
      id_7,
      id_2,
      id_4,
      id_0,
      id_5,
      id_7,
      id_7
  );
  initial begin : LABEL_0
    id_9 = id_9;
  end
endmodule

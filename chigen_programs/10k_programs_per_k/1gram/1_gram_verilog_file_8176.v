// Seed: 3254062735
module module_0 (
    input  tri0  id_0,
    output wand  id_1,
    input  tri1  id_2,
    output wor   id_3,
    output tri   id_4,
    output tri0  id_5,
    output tri0  id_6,
    output tri   id_7,
    input  tri0  id_8,
    input  wor   id_9,
    input  uwire id_10,
    input  wand  id_11,
    input  tri1  id_12,
    output wire  id_13
);
  wire id_15;
  wire id_16;
  wire id_17;
  tri0 id_18, id_19;
  supply1 id_20, id_21, id_22;
  uwire id_23, id_24, id_25;
  assign module_1.type_2 = 0;
  assign id_25 = {id_23 == id_22};
  assign id_19 = id_11;
  initial begin : LABEL_0$display
    ;
  end
endmodule
module module_1 (
    input supply1 id_0,
    input wire id_1,
    input supply0 id_2,
    input supply1 id_3,
    input tri0 id_4,
    input tri0 id_5,
    input tri0 id_6,
    input tri1 id_7,
    output wire id_8,
    output wor id_9
);
  wand id_11 = 1 == id_0, id_12;
  wire id_13;
  module_0 modCall_1 (
      id_0,
      id_9,
      id_1,
      id_8,
      id_8,
      id_9,
      id_9,
      id_9,
      id_6,
      id_5,
      id_1,
      id_0,
      id_6,
      id_8
  );
  supply0 id_14, id_15, id_16, id_17, id_18 = id_0, id_19;
endmodule

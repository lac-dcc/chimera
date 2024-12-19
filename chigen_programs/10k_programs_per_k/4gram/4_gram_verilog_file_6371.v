// Seed: 1422837702
module module_0 (
    output uwire id_0,
    input tri0 id_1,
    input supply0 id_2,
    input tri0 id_3,
    input wire id_4,
    input tri1 id_5,
    input uwire id_6,
    output supply0 id_7,
    input wand id_8,
    input supply0 id_9,
    output supply1 id_10
);
  tri1 id_12;
  wire id_13;
  initial begin : LABEL_0
    id_12 = id_9;
  end
  assign module_1.type_2 = 0;
endmodule
module module_1 (
    input  wand id_0,
    input  tri1 id_1,
    input  tri0 id_2,
    output wor  id_3
);
  uwire id_5 = 1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_0,
      id_0,
      id_1,
      id_0,
      id_3,
      id_1,
      id_2,
      id_3
  );
  assign id_3 = id_0;
  assign #id_6 id_3 = 1;
  final $display;
endmodule

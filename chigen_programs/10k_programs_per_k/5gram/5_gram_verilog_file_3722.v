// Seed: 3902429893
module module_0 (
    input  tri  id_0,
    output wand id_1,
    output wand id_2,
    input  wand id_3,
    input  wire id_4
);
  assign id_2 = id_4 ==? 1;
  assign module_1.type_0 = 0;
  initial begin : LABEL_0
    id_2 = 1;
  end
endmodule
module module_1 (
    output tri1 id_0,
    output wire id_1,
    output tri0 id_2,
    input  wire id_3,
    input  tri  id_4,
    input  tri0 id_5,
    output tri  id_6
);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_6,
      id_3,
      id_5
  );
  wire id_8;
  assign id_6 = 1;
  assign id_1 = 1 > id_4;
endmodule

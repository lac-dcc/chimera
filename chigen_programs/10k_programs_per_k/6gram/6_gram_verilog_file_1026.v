// Seed: 510755174
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    output tri0 id_2
);
  int id_4;
  module_2 modCall_1 (
      id_2,
      id_0
  );
  wire id_5;
endmodule
module module_1 (
    input  tri0 id_0,
    output tri0 id_1,
    input  wand id_2,
    output wand id_3
);
  id_5(
      id_6, id_1, id_0
  );
  module_0 modCall_1 (
      id_0,
      id_2,
      id_3
  );
  assign modCall_1.id_0 = 0;
  wire id_7;
endmodule
module module_2 (
    output wor  id_0
    , id_3,
    input  wand id_1
);
  wire id_4;
  assign module_0.type_0 = 0;
endmodule
module module_3 (
    input tri0 id_0,
    input wire id_1,
    input supply1 id_2,
    input supply0 id_3,
    input wire id_4,
    output wand id_5
);
  assign id_5 = id_4;
  module_2 modCall_1 (
      id_5,
      id_0
  );
  assign modCall_1.type_0 = 0;
  initial begin : LABEL_0
    if (id_4) assume (id_3);
  end
endmodule

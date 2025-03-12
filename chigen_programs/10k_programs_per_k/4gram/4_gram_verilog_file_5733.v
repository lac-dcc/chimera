// Seed: 1962182939
module module_0 (
    output tri1  id_0,
    output wand  id_1,
    output uwire id_2,
    input  wand  id_3
);
  assign id_2 = id_3;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    output wand id_0,
    input tri0 id_1,
    input supply0 id_2,
    output tri0 id_3,
    output tri1 id_4,
    output wand id_5
    , id_8,
    output tri id_6
);
  module_0 modCall_1 (
      id_6,
      id_5,
      id_5,
      id_1
  );
endmodule
module module_2 (
    output logic   id_0
    , id_5,
    input  uwire   id_1,
    input  supply1 id_2,
    output supply0 id_3
);
  reg id_6 = -1 - id_5;
  supply0 id_7 = -1;
  initial begin : LABEL_0
    id_6 <= 1;
    if (-1) id_0 <= id_7;
  end
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_2
  );
  assign modCall_1.id_0 = 0;
endmodule

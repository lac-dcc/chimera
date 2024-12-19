// Seed: 4260173486
module module_0 (
    output wire id_0,
    input supply0 id_1,
    output tri0 id_2,
    input tri id_3,
    output wand id_4,
    input tri0 id_5,
    output uwire id_6
    , id_10,
    input uwire id_7,
    output wand id_8
);
  initial begin : LABEL_0
    forever id_10 <= 1;
  end
  initial #id_11 id_4 = 1'b0;
endmodule
module module_1 (
    output supply0 id_0
    , id_9,
    input supply1 id_1,
    input wand id_2,
    input wand id_3,
    input uwire id_4,
    input tri id_5,
    input tri0 id_6,
    input wor id_7
);
  assign id_9 = id_4;
  always force id_9 = ({1, 1, 'd0 !=? 1, 1, id_4 & id_4, 1, ^id_5});
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_9,
      id_9,
      id_3,
      id_0,
      id_1,
      id_0
  );
  assign modCall_1.id_1 = 0;
  assign id_9 = 1;
endmodule

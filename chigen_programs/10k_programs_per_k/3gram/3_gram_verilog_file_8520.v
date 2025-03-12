// Seed: 2722704113
macromodule module_0 (
    input supply1 id_0,
    output supply0 id_1,
    output wand id_2,
    input supply0 id_3,
    input supply1 id_4
    , id_7,
    input uwire id_5
);
  wire id_8;
  ;
  wire [1 'b0 : -1] id_9;
  initial begin : LABEL_0
    id_7[-1 : ~1] = -1;
  end
  wire id_10;
  ;
endmodule
module module_1 (
    input tri id_0,
    output tri id_1,
    input supply1 id_2,
    output uwire id_3,
    input wire id_4
);
  wire id_6;
  ;
  and primCall (id_3, id_2, id_0, id_6, id_4);
  module_0 modCall_1 (
      id_2,
      id_1,
      id_3,
      id_4,
      id_0,
      id_2
  );
  assign modCall_1.id_2 = 0;
endmodule

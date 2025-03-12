// Seed: 2666597313
module module_0 (
    input  uwire id_0,
    input  wand  id_1,
    input  tri1  id_2,
    output tri0  id_3,
    output wor   id_4
);
  reg id_6;
  always
    repeat (id_0) begin : LABEL_0
      if (1) begin : LABEL_1
        id_6 <= 1;
      end
    end
endmodule
module module_1 (
    input uwire id_0,
    output wand id_1,
    input tri1 id_2,
    output wor id_3,
    input tri1 id_4,
    output wand id_5,
    input tri0 id_6,
    input supply1 id_7,
    output tri0 id_8,
    input wire id_9,
    input wor id_10
    , id_14,
    input wor id_11
    , id_15,
    input tri0 id_12
);
  wire id_16;
  ;
  xnor primCall (
      id_1, id_14, id_9, id_0, id_7, id_11, id_15, id_16, id_10, id_6, id_2, id_12, id_4
  );
  module_0 modCall_1 (
      id_6,
      id_10,
      id_2,
      id_5,
      id_1
  );
  assign modCall_1.id_4 = 0;
endmodule

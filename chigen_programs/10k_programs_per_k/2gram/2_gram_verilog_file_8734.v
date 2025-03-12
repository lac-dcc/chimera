// Seed: 2887460200
module module_0 (
    input uwire id_0,
    input wand id_1,
    input wand id_2,
    input supply0 id_3,
    output wand id_4,
    output wor id_5,
    input tri1 id_6,
    input uwire id_7
    , id_13,
    input tri id_8,
    input wand id_9,
    output tri1 id_10,
    output tri1 id_11
);
  wire id_14;
  assign id_11 = 1 == -1;
  initial
    @(posedge id_9) begin : LABEL_0
      $signed(69);
      ;
    end
  wire id_15;
endmodule
module module_1 (
    output tri id_0,
    output supply1 id_1,
    output uwire id_2,
    output wand id_3,
    input wor id_4,
    input tri1 id_5,
    input wire id_6,
    input wire id_7,
    output tri0 id_8,
    input tri0 id_9,
    output wor id_10,
    input supply0 id_11,
    input tri1 id_12,
    output supply0 id_13,
    input uwire id_14
);
  assign id_13 = id_7;
  and primCall (id_10, id_4, id_12, id_6, id_14, id_11, id_5, id_9);
  module_0 modCall_1 (
      id_6,
      id_11,
      id_4,
      id_4,
      id_2,
      id_2,
      id_7,
      id_4,
      id_4,
      id_12,
      id_1,
      id_10
  );
  assign modCall_1.id_11 = 0;
endmodule

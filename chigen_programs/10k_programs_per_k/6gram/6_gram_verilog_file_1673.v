// Seed: 2145038659
module module_0 (
    input tri1 id_0,
    output wor id_1,
    input wor id_2,
    input tri0 id_3
    , id_15,
    input uwire id_4,
    input uwire id_5,
    input wor id_6,
    input supply0 id_7,
    output wand id_8
    , id_16,
    input tri0 id_9,
    input wor id_10,
    output tri0 id_11,
    input uwire id_12
    , id_17,
    output tri id_13
);
  assign id_8 = 1;
  initial begin : LABEL_0
    id_16 <= #id_12 id_15 == {id_12{id_4}};
  end
endmodule
module module_1 (
    input supply1 id_0,
    input supply0 id_1,
    input tri id_2,
    output tri id_3,
    input supply0 id_4,
    input wand id_5,
    input supply1 id_6,
    input tri1 id_7,
    output uwire id_8,
    input uwire id_9,
    input wand id_10,
    input supply0 id_11,
    output wire id_12,
    output wor id_13,
    output tri0 id_14,
    output wand id_15,
    output tri0 id_16,
    output wand id_17,
    input uwire id_18,
    input uwire id_19,
    input tri0 id_20,
    input supply1 id_21,
    input wire id_22,
    output supply1 id_23,
    output tri id_24
);
  wire id_26, id_27;
  logic id_28;
  ;
  module_0 modCall_1 (
      id_22,
      id_13,
      id_4,
      id_1,
      id_6,
      id_21,
      id_18,
      id_20,
      id_24,
      id_9,
      id_7,
      id_23,
      id_2,
      id_14
  );
  assign modCall_1.id_9 = 0;
  assign id_13 = -1'd0;
endmodule

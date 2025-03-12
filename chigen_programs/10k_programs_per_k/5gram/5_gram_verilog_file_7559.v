// Seed: 2311341162
module module_0 (
    input tri id_0,
    input supply1 id_1,
    output tri id_2,
    input uwire id_3
    , id_26,
    input supply1 id_4,
    output supply1 id_5,
    output tri1 id_6,
    input tri id_7,
    input wire id_8,
    input wand id_9,
    input tri0 id_10,
    output uwire id_11,
    input uwire id_12,
    input supply1 id_13,
    input wand id_14,
    input uwire id_15,
    output wand id_16,
    input tri id_17,
    input supply0 id_18,
    input wor id_19,
    output wire id_20,
    output supply0 id_21,
    input tri1 id_22,
    output wand id_23,
    input uwire id_24
);
  assign id_26 = id_10 == 1;
  assign module_1.id_13 = 0;
  assign id_23 = -1;
  wire id_27;
endmodule
module module_1 (
    input supply0 id_0,
    output tri id_1,
    output tri id_2,
    output uwire id_3,
    input wor id_4,
    input wor id_5,
    input uwire id_6,
    output uwire id_7,
    output uwire id_8,
    output supply1 id_9,
    output wire id_10,
    output wire id_11,
    output tri1 id_12,
    input supply1 id_13,
    input tri1 id_14,
    output tri id_15,
    input wand id_16,
    input supply0 id_17,
    output uwire id_18,
    output tri id_19,
    input wand id_20,
    input wire id_21,
    input wor id_22,
    output supply0 id_23,
    input supply1 id_24,
    output wand id_25,
    inout supply1 id_26
);
  wire [-1 : 1 'b0] id_28;
  nand primCall (
      id_2, id_24, id_5, id_28, id_20, id_21, id_26, id_22, id_17, id_13, id_0, id_4, id_14, id_6
  );
  module_0 modCall_1 (
      id_22,
      id_22,
      id_25,
      id_4,
      id_6,
      id_18,
      id_3,
      id_20,
      id_5,
      id_26,
      id_16,
      id_23,
      id_17,
      id_14,
      id_22,
      id_17,
      id_7,
      id_4,
      id_5,
      id_5,
      id_19,
      id_26,
      id_20,
      id_12,
      id_16
  );
  wire id_29;
  ;
endmodule

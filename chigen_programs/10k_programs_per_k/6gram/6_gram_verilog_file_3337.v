// Seed: 927404568
module module_0 (
    input tri id_0,
    output tri1 id_1,
    input uwire id_2,
    output supply0 id_3,
    output wire id_4,
    input tri0 id_5,
    input wor id_6,
    input wand id_7,
    input wire id_8,
    output wand id_9,
    output tri0 id_10,
    input tri id_11,
    input uwire id_12,
    input tri0 id_13,
    input wor id_14,
    input tri0 id_15,
    input wand id_16,
    input supply0 id_17,
    input tri0 id_18,
    output supply1 id_19
);
  wire id_21;
  assign id_9 = (id_6) | 1;
  wire id_22, id_23;
  assign module_1.id_23 = 0;
endmodule
module module_1 (
    input supply0 id_0
    , id_32,
    input tri1 id_1,
    input uwire id_2,
    input wire id_3,
    input tri1 id_4,
    input wand id_5,
    output tri id_6,
    input wire id_7,
    input tri1 id_8,
    output wire id_9,
    input wand id_10,
    output tri1 id_11,
    output supply0 id_12,
    input tri0 id_13,
    input wor id_14,
    output tri id_15,
    input supply1 id_16,
    input wand id_17,
    input supply0 id_18,
    input uwire id_19,
    input uwire id_20,
    input uwire id_21,
    input wire id_22,
    output uwire id_23,
    input uwire id_24,
    input tri id_25,
    input wire id_26,
    input wand id_27,
    input wand id_28,
    input uwire id_29
    , id_33,
    input wand id_30
    , id_34
);
  assign id_6  = 1'b0;
  assign id_11 = ((1'b0)) ? id_20 : 1;
  xnor primCall (
      id_12,
      id_25,
      id_29,
      id_0,
      id_2,
      id_10,
      id_7,
      id_18,
      id_20,
      id_16,
      id_22,
      id_26,
      id_3,
      id_8,
      id_27,
      id_33,
      id_28,
      id_34,
      id_17,
      id_4,
      id_32,
      id_30,
      id_24,
      id_13,
      id_1,
      id_14,
      id_19,
      id_5,
      id_21
  );
  module_0 modCall_1 (
      id_4,
      id_12,
      id_26,
      id_12,
      id_9,
      id_3,
      id_3,
      id_21,
      id_24,
      id_11,
      id_11,
      id_30,
      id_20,
      id_24,
      id_10,
      id_5,
      id_29,
      id_0,
      id_0,
      id_12
  );
endmodule

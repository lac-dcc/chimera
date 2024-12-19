// Seed: 450696288
macromodule module_0 (
    output uwire id_0,
    input wand id_1,
    input wand id_2,
    input supply1 id_3,
    input wand id_4,
    output wand id_5,
    output supply0 id_6,
    input tri1 id_7,
    output tri0 id_8,
    input tri id_9,
    input tri0 id_10,
    output wire id_11,
    input wor id_12,
    input wor id_13,
    output tri1 id_14,
    input tri0 id_15,
    input supply1 id_16
);
  wire id_18, id_19;
  assign module_1.type_10 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    input wand id_1,
    input wor id_2,
    input tri0 id_3,
    input uwire id_4,
    input tri0 id_5,
    output wire id_6,
    output wor id_7,
    output wor id_8,
    input tri0 id_9,
    input supply1 id_10,
    input tri0 id_11,
    output supply0 id_12,
    output wand id_13,
    output tri1 id_14,
    output supply1 id_15,
    input supply1 id_16,
    output tri id_17,
    output tri0 id_18,
    input tri0 id_19,
    input wand id_20,
    output wire id_21,
    output supply1 id_22,
    input wand id_23,
    output uwire id_24,
    output tri1 id_25,
    input tri1 id_26,
    output tri0 id_27,
    input supply1 id_28,
    input wor id_29,
    input tri id_30,
    input tri id_31,
    input wire id_32,
    output supply0 id_33,
    input tri id_34,
    input wor id_35,
    output tri0 id_36,
    output uwire id_37,
    input supply1 id_38,
    input supply0 id_39,
    input supply1 id_40,
    input supply0 id_41
    , id_45,
    output wand id_42,
    input wire id_43
);
  logic [7:0][1] id_46 = id_1 ^ 1'b0;
  assign id_33 = id_0 == id_46;
  final id_7 = 1'h0;
  wire id_47;
  module_0 modCall_1 (
      id_18,
      id_5,
      id_43,
      id_31,
      id_30,
      id_7,
      id_18,
      id_19,
      id_15,
      id_11,
      id_26,
      id_12,
      id_1,
      id_4,
      id_12,
      id_19,
      id_23
  );
  logic [7:0] id_48;
  assign id_22 = {1, (id_1)} == id_48[1 : 1];
endmodule

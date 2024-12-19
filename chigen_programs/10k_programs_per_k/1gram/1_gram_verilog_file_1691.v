// Seed: 3993816725
macromodule module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_2 = 1;
  wire id_7;
  id_8(
      .id_0(id_2)
  );
  assign module_1.type_57 = 0;
  wire id_9;
endmodule
module module_1 (
    output tri id_0,
    input tri0 id_1,
    output tri1 id_2,
    output wand id_3,
    input tri0 id_4,
    input tri0 id_5,
    input wor id_6,
    output tri id_7,
    input wire id_8,
    input tri0 id_9,
    input tri1 id_10,
    output uwire id_11,
    output wire id_12,
    output wand id_13,
    input supply1 id_14,
    output tri id_15,
    input tri id_16,
    input wand id_17,
    input tri0 id_18,
    output uwire id_19,
    input tri id_20,
    input wor id_21,
    output supply1 id_22,
    output tri id_23,
    output supply1 id_24,
    input supply0 id_25,
    input wor id_26,
    input wire id_27,
    input supply0 id_28,
    output wor id_29,
    input tri0 id_30,
    input tri1 id_31,
    output tri0 id_32
    , id_45,
    output wire id_33,
    output supply0 id_34,
    input tri1 id_35,
    input wand id_36,
    output wire id_37,
    input supply1 id_38,
    input wire id_39,
    output uwire id_40
    , id_46,
    input wor id_41,
    input wor id_42,
    input tri id_43
);
  assign id_2 = 1;
  wire id_47, id_48;
  assign id_24 = !id_35;
  wire  id_49;
  wire  id_50;
  uwire id_51, id_52 = 1;
  module_0 modCall_1 (
      id_47,
      id_51,
      id_48,
      id_49,
      id_51,
      id_47
  );
  assign id_2 = id_46;
  id_53 :
  assert property (@(posedge 1 or 1) id_30) id_29 = 1;
endmodule

// Seed: 1430226329
module module_0 (
    output tri id_0,
    input wand id_1,
    input supply1 id_2,
    output wor id_3,
    output tri1 id_4,
    input wire id_5,
    output wire id_6,
    input tri0 id_7[-1 : 1],
    output uwire id_8,
    input tri0 id_9,
    output tri0 id_10,
    output wor id_11,
    input supply0 id_12,
    output tri1 id_13
);
  supply0 id_15 = 1;
  assign module_1.id_29 = 0;
endmodule
module module_1 #(
    parameter id_10 = 32'd75,
    parameter id_29 = 32'd9,
    parameter id_32 = 32'd27,
    parameter id_43 = 32'd67,
    parameter id_50 = 32'd56
) (
    output supply1 id_0,
    output tri0 id_1,
    input tri id_2,
    input wor id_3,
    input supply0 id_4,
    input tri0 id_5,
    output wand id_6,
    input wire id_7,
    input wire id_8,
    input tri0 id_9,
    output tri1 _id_10,
    input tri1 id_11,
    output uwire id_12
    , id_46 = 1,
    output tri0 id_13,
    input wor id_14,
    input supply0 id_15,
    input tri0 id_16,
    output tri0 id_17,
    input wand id_18,
    input uwire id_19,
    output supply1 id_20,
    output tri id_21,
    output supply1 id_22,
    input tri id_23,
    output supply0 id_24,
    output uwire id_25,
    inout supply0 id_26,
    output wor id_27,
    input wand id_28,
    input supply1 _id_29,
    input uwire id_30[1 : id_29  -  id_10],
    input wor id_31,
    input wire _id_32,
    output uwire id_33,
    input tri0 id_34,
    output tri1 id_35,
    input tri id_36,
    input tri0 id_37,
    input supply1 id_38,
    output tri0 id_39,
    output supply0 id_40,
    input supply1 id_41,
    output wor id_42,
    input tri1 _id_43,
    output supply1 id_44
);
  wire id_47, id_48, id_49;
  wire _id_50;
  ;
  assign id_20 = 1;
  xor primCall (
      id_42,
      id_15,
      id_38,
      id_11,
      id_2,
      id_47,
      id_9,
      id_28,
      id_30,
      id_48,
      id_46,
      id_14,
      id_23,
      id_36,
      id_26,
      id_7,
      id_19,
      id_37,
      id_41,
      id_34,
      id_8,
      id_5,
      id_16,
      id_18,
      id_4,
      id_31,
      id_49
  );
  module_0 modCall_1 (
      id_44,
      id_9,
      id_38,
      id_35,
      id_35,
      id_36,
      id_26,
      id_3,
      id_33,
      id_26,
      id_40,
      id_42,
      id_7,
      id_42
  );
  assign id_46[id_32][id_50*id_43] = id_37 ^ id_5;
endmodule

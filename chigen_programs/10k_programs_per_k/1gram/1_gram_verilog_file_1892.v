// Seed: 606451936
module module_0 (
    input supply1 id_0,
    input wire id_1,
    input tri0 id_2
);
  assign module_1.id_24 = 0;
endmodule
module module_1 #(
    parameter id_29 = 32'd35,
    parameter id_39 = 32'd29,
    parameter id_40 = 32'd24,
    parameter id_43 = 32'd3
) (
    input supply1 id_0,
    input wire id_1,
    output uwire id_2,
    output supply0 id_3,
    input tri id_4,
    input uwire id_5,
    output supply0 id_6,
    input tri0 id_7,
    output wire id_8,
    input tri0 id_9,
    input tri0 id_10,
    input uwire id_11,
    input wire id_12,
    input wand id_13,
    output tri id_14,
    input wand id_15,
    input tri0 id_16,
    output tri1 id_17,
    input wand id_18,
    output uwire id_19,
    output tri1 id_20,
    input wor id_21,
    output tri0 id_22,
    output tri0 id_23,
    output uwire id_24,
    input uwire id_25[-1 : id_40]
    , id_42,
    input tri id_26,
    input supply0 id_27,
    input tri id_28,
    input wand _id_29,
    input tri0 id_30,
    input tri id_31,
    output supply0 id_32,
    input tri0 id_33,
    input tri id_34[-1 : id_39],
    output wire id_35,
    output wor id_36,
    input tri0 id_37,
    output supply0 id_38,
    input wire _id_39,
    output supply1 _id_40
);
  _id_43[1'h0+:{
    id_43, !{id_29}
  }] (
      -1, id_25, id_12, 1'h0 ^ id_26(1'b0, ~|id_4 < 1 <-> id_31, id_12, id_37), id_0
  );
  logic id_44;
  module_0 modCall_1 (
      id_12,
      id_34,
      id_31
  );
endmodule

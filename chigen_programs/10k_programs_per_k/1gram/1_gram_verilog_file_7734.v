// Seed: 1466133629
module module_0 (
    input supply1 id_0,
    output logic id_1,
    input supply0 id_2,
    input wor id_3,
    input tri0 id_4,
    output wand id_5,
    input wor id_6,
    input tri id_7,
    input tri0 id_8
);
  pulldown (strong0) (.id_0(1), .id_1(-1'd0));
  assign id_1 = id_0;
  always_ff id_1 <= 1;
  assign id_1 = 1;
endmodule
program module_1 #(
    parameter id_10 = 32'd86,
    parameter id_40 = 32'd83
) (
    output uwire id_0,
    input wire id_1,
    input uwire id_2,
    input supply1 id_3,
    output supply0 id_4,
    input supply1 id_5,
    input wand id_6,
    input wand id_7,
    output uwire id_8,
    input tri0 id_9,
    input wor _id_10,
    input tri id_11,
    input supply0 id_12,
    input wire id_13,
    input wire id_14,
    input tri id_15,
    input tri0 id_16,
    input wor id_17,
    output supply1 id_18,
    input supply1 id_19,
    output supply0 id_20,
    input supply0 id_21,
    input uwire id_22,
    output tri id_23,
    output logic id_24,
    output tri1 id_25,
    input tri id_26
    , id_42,
    input supply0 id_27,
    input tri1 id_28,
    output supply0 id_29,
    output uwire id_30,
    input supply0 id_31,
    input tri1 id_32,
    input wor id_33,
    input uwire id_34,
    input tri0 id_35,
    input tri id_36,
    input tri id_37,
    input tri0 id_38,
    output tri id_39,
    output wor _id_40[id_40 : id_10]
);
  wire id_43, id_44;
  wire id_45, id_46;
  module_0 modCall_1 (
      id_35,
      id_24,
      id_3,
      id_7,
      id_22,
      id_4,
      id_16,
      id_21,
      id_26
  );
  assign modCall_1.id_4 = 0;
  always_latch id_24 <= -1;
endprogram

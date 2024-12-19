// Seed: 4251715048
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_11;
endmodule
module module_1 #(
    parameter id_57 = 32'd40,
    parameter id_58 = 32'd26
) (
    input tri id_0,
    input wire id_1,
    input wire id_2,
    input supply0 id_3,
    output wor id_4,
    input tri0 id_5,
    input supply1 id_6,
    input tri1 id_7,
    input supply1 id_8,
    input tri1 id_9,
    input wire id_10,
    input wire id_11,
    input wand id_12,
    input supply1 id_13,
    output wand id_14,
    output tri id_15,
    input supply0 id_16,
    input supply1 id_17,
    output tri0 id_18,
    input tri0 id_19,
    output tri1 id_20
    , id_51,
    input tri0 id_21,
    input tri id_22,
    input tri id_23,
    input uwire id_24,
    output uwire id_25,
    input wire id_26,
    output supply1 id_27,
    input supply1 id_28,
    output supply0 id_29,
    input supply0 id_30,
    input wor id_31,
    output wire id_32,
    input supply1 id_33,
    input wor id_34,
    output tri0 id_35,
    input uwire id_36,
    output wand id_37,
    output tri1 id_38,
    output tri id_39,
    output supply0 id_40,
    output uwire id_41,
    input uwire id_42,
    output uwire id_43,
    output wor id_44,
    input wor id_45,
    output uwire id_46,
    input uwire id_47,
    input tri id_48,
    output wand id_49
);
  wire id_52;
  if (1'b0) begin : LABEL_0
    assign id_18 = 1 - id_21;
    wire id_53;
    wire id_54;
    wire id_55;
    wire id_56;
    always
      if (id_36) begin : LABEL_0
        id_29 = id_13;
      end
    defparam id_57.id_58 = 1'b0;
    wire id_59;
  end else wire id_60;
  nand primCall (
      id_4,
      id_36,
      id_22,
      id_59,
      id_52,
      id_16,
      id_48,
      id_60,
      id_1,
      id_6,
      id_13,
      id_11,
      id_2,
      id_19,
      id_54,
      id_51,
      id_28,
      id_7,
      id_33,
      id_45,
      id_0,
      id_10,
      id_57,
      id_26,
      id_9,
      id_21,
      id_56,
      id_42,
      id_55,
      id_34,
      id_58,
      id_3,
      id_5,
      id_12,
      id_30,
      id_53,
      id_24,
      id_8,
      id_31,
      id_17,
      id_62,
      id_47,
      id_23,
      id_61
  );
  wire id_61;
  wire id_62;
  module_0 modCall_1 (
      id_60,
      id_54,
      id_59,
      id_61,
      id_55,
      id_59,
      id_59,
      id_53,
      id_56,
      id_59
  );
endmodule

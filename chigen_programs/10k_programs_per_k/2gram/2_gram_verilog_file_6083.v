// Seed: 831243362
module module_0 (
    output tri id_0,
    input tri1 id_1,
    input uwire id_2,
    output supply0 id_3,
    output wire id_4
    , id_18, id_19,
    output tri0 id_5,
    input wor id_6,
    input wand id_7,
    input wire id_8,
    input wand id_9,
    input tri0 id_10
    , id_20,
    input tri id_11,
    input uwire id_12,
    input tri0 id_13,
    output wor id_14,
    output tri0 id_15,
    output wand id_16
);
  wire id_21;
  wire id_22;
endmodule
module module_1 #(
    parameter id_14 = 32'd56,
    parameter id_17 = 32'd60,
    parameter id_2  = 32'd33,
    parameter id_36 = 32'd23
) (
    input tri id_0,
    input tri0 id_1,
    input tri _id_2,
    input wor id_3,
    input uwire id_4,
    input tri id_5,
    output tri id_6,
    input tri0 id_7,
    input tri0 id_8,
    input uwire id_9,
    input wor id_10
    , id_39,
    input wand id_11,
    output wor id_12
    , id_40,
    input supply1 id_13,
    output supply0 _id_14,
    input wor id_15,
    input tri0 id_16,
    input wand _id_17,
    output wire id_18,
    output supply0 id_19,
    input tri0 id_20,
    output logic id_21,
    output wire id_22,
    output supply1 id_23,
    input tri1 id_24,
    input tri id_25,
    input wand id_26,
    output wor id_27,
    input tri1 id_28,
    input supply1 id_29,
    input uwire id_30,
    input wand id_31,
    input tri0 id_32,
    input uwire id_33,
    input tri1 id_34,
    input supply0 id_35,
    input uwire _id_36,
    output supply0 id_37
    , id_41
);
  assign id_6 = id_28 != 1;
  tri1 id_42 = 1;
  wire [id_2 : id_17] id_43 = id_43;
  module_0 modCall_1 (
      id_6,
      id_0,
      id_4,
      id_19,
      id_18,
      id_12,
      id_10,
      id_35,
      id_26,
      id_16,
      id_20,
      id_15,
      id_33,
      id_31,
      id_23,
      id_12,
      id_19
  );
  assign modCall_1.id_7 = 0;
  wire id_44;
  wire id_45 = (id_4);
  logic [id_14 : id_36] id_46, id_47;
  generate
    assign id_42 = id_15;
    always begin : LABEL_0
      id_40 = id_0;
      id_21 <= id_31;
      fork : SymbolIdentifier
      join
      $unsigned(80);
      ;
    end
  endgenerate
  supply0 id_48 = 1;
endmodule

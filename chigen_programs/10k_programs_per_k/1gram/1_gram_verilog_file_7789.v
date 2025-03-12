// Seed: 2937519418
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    input wor id_2,
    output wor id_3,
    input tri0 id_4
    , id_9,
    input wand id_5,
    input wire id_6,
    input supply0 id_7
);
  generate
    assign id_3 = -1'b0;
  endgenerate
endmodule
module module_1 #(
    parameter id_18 = 32'd84
) (
    output logic id_0,
    input tri0 id_1,
    output supply1 id_2,
    input supply0 id_3,
    output tri id_4,
    output tri1 id_5#(
        .id_32(1),
        .id_33(-1)
    ),
    input supply0 id_6,
    inout wor id_7,
    input wor id_8,
    output supply0 id_9,
    input wor id_10,
    output wor id_11,
    input tri1 id_12,
    input tri1 id_13,
    input supply1 id_14,
    input uwire id_15,
    input tri1 id_16,
    output supply1 id_17,
    input tri1 _id_18,
    input wor id_19,
    input tri id_20,
    input tri1 id_21,
    input supply0 id_22,
    input wand id_23
    , id_34,
    input uwire id_24#(
        .id_35(1 & -1 ? 1 : -1),
        .id_36(1),
        .id_37(1),
        .id_38(-1 == -1),
        .id_39(1),
        .id_40(-1'b0)
    ),
    output supply0 id_25,
    input wire id_26
    , id_41, id_42,
    input tri0 id_27,
    input tri id_28,
    input wand id_29,
    input tri0 id_30[-1 : id_18]
);
  assign id_42[-1 :-1'h0] = id_20;
  logic [7:0] id_43, id_44, id_45;
  assign id_2  = -1;
  assign id_35 = {-1, 1, id_28, 1, -1} & id_34;
  reg \id_46 , id_47;
  wire id_48;
  parameter id_49 = -1 - 1;
  assign id_47 = id_44[1];
  nand primCall (
      id_2,
      id_49,
      id_6,
      id_35,
      id_28,
      id_26,
      id_50,
      id_14,
      id_16,
      id_30,
      id_37,
      id_24,
      id_29,
      id_38,
      id_19,
      id_10,
      id_36,
      id_34,
      id_23,
      id_44,
      id_43,
      id_42,
      \id_46 ,
      id_45,
      id_27,
      id_8,
      id_20,
      id_12,
      id_22,
      id_39,
      id_48,
      id_32,
      id_1,
      id_47,
      id_15,
      id_7,
      id_13,
      id_3
  );
  parameter id_50 = 1;
  module_0 modCall_1 (
      id_7,
      id_12,
      id_28,
      id_9,
      id_24,
      id_16,
      id_1,
      id_21
  );
  assign modCall_1.id_4 = 0;
  wire id_51;
  ;
  pullup (id_4 - -1, id_38);
  final begin : LABEL_0
    @(*) id_47 = id_42;
    id_0 <= id_44;
  end
  assign id_33 = 1;
endmodule

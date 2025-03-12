// Seed: 2131804663
module module_0 (
    input wire id_0,
    output tri1 id_1,
    input uwire id_2,
    output uwire id_3,
    input tri id_4,
    output supply1 id_5,
    input supply1 id_6,
    input wand id_7,
    input tri0 id_8
);
endmodule
module module_1 #(
    parameter id_0  = 32'd29,
    parameter id_13 = 32'd2
) (
    input supply1 _id_0,
    output wire id_1,
    input wire id_2,
    input tri0 id_3,
    output supply0 id_4#(
        .id_21(1),
        .id_22(1),
        .id_23(1),
        .id_24(1'h0 && -1 - -1 && 1 && 1),
        .id_25(1)
    ),
    input supply1 id_5,
    output tri0 id_6,
    output tri0 id_7,
    input tri1 id_8,
    output tri0 id_9,
    input tri id_10,
    input wor id_11,
    input wand id_12,
    input supply0 _id_13,
    input wand id_14,
    input tri id_15,
    input tri1 id_16,
    output supply1 id_17,
    input tri1 id_18,
    input wire id_19
);
  wire [id_13 : id_0] id_26;
  module_0 modCall_1 (
      id_16,
      id_4,
      id_15,
      id_6,
      id_18,
      id_1,
      id_2,
      id_16,
      id_8
  );
  assign modCall_1.id_1 = 0;
  assign id_4 = -1'b0;
  always begin : LABEL_0
    if (1 - (1))
      if (1) id_24 <= id_8;
      else begin : LABEL_1
        id_24 = -1;
      end
  end
  wire id_27;
  wire id_28;
  wire id_29;
  wire id_30;
  xnor primCall (
      id_4, id_15, id_2, id_24, id_26, id_3, id_18, id_16, id_22, id_19, id_12, id_11, id_23, id_21
  );
  assign id_27 = id_2;
  assign id_17 = -1;
endmodule

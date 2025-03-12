// Seed: 3656950930
module module_0 (
    input supply0 id_0
);
endmodule
module module_1 #(
    parameter id_13 = 32'd62,
    parameter id_30 = 32'd24,
    parameter id_32 = 32'd19
) (
    input supply1 id_0,
    input tri id_1,
    output supply0 id_2,
    input supply1 id_3,
    input supply0 id_4,
    input wand id_5,
    output tri id_6,
    input uwire id_7,
    input tri1 id_8,
    input tri0 id_9,
    output logic id_10,
    input uwire id_11,
    inout wire id_12,
    input tri _id_13,
    input uwire id_14,
    input tri1 id_15,
    input wor id_16,
    output supply1 id_17,
    input uwire id_18,
    output wor id_19,
    output supply1 id_20,
    output logic id_21,
    input tri id_22,
    input wor id_23,
    input tri id_24,
    input tri1 id_25,
    input tri1 id_26,
    input wor id_27,
    output supply1 id_28,
    input wor id_29,
    input tri1 _id_30
);
  wire _id_32;
  assign id_20 = 1;
  assign id_28 = id_29;
  wire id_33;
  parameter id_34 = -1;
  always begin : LABEL_0
    id_21 <= id_23 ? id_18 : id_16;
    id_21 <= id_12;
    if (-1) id_10 <= -1;
  end
  assign id_10 = 1;
  assign id_19 = {-1, 1'b0, id_13, id_33, -1};
  and primCall (
      id_2,
      id_26,
      id_18,
      id_15,
      id_29,
      id_22,
      id_9,
      id_34,
      id_33,
      id_11,
      id_16,
      id_40,
      id_4,
      id_14,
      id_24,
      id_35,
      id_25,
      id_12,
      id_1,
      id_7,
      id_0,
      id_27,
      id_5,
      id_36,
      id_23,
      id_38,
      id_37,
      id_3
  );
  wire id_35;
  logic [id_30 : id_32] id_36;
  wire [1 : id_13] id_37;
  wire [-1 : ~  1] id_38;
  wire id_39;
  logic id_40;
  module_0 modCall_1 (id_8);
  assign modCall_1.id_0 = 0;
endmodule

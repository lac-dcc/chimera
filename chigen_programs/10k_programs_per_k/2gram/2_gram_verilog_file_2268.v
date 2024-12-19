// Seed: 1058914158
module module_0 (
    id_1
);
  output wire id_1;
  always_ff
    if (1) begin : LABEL_0
      id_1 = 1;
    end
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  assign id_1 = id_2;
  wire id_3;
  not primCall (id_1, id_2);
  module_0 modCall_1 (id_3);
  assign modCall_1.id_1 = 0;
  assign id_1 = 1;
endmodule
module module_2 (
    output tri1 id_0,
    output wor  id_1
);
endmodule
module module_3 #(
    parameter id_19 = 32'd2,
    parameter id_2  = 32'd17,
    parameter id_23 = 32'd92
) (
    input supply0 id_0,
    output wor id_1,
    input supply0 _id_2,
    output supply1 id_3,
    output wor id_4,
    input tri id_5,
    output supply1 id_6,
    input tri0 id_7,
    inout tri1 id_8,
    output tri0 id_9,
    output wire id_10,
    output supply0 id_11,
    input tri1 id_12,
    input wand id_13,
    input wire id_14,
    input supply1 id_15,
    input tri1 id_16,
    output wor id_17,
    input tri id_18,
    inout uwire _id_19,
    input tri0 id_20,
    input wand id_21,
    input tri0 id_22,
    input wand _id_23
);
  always_latch release id_1[{id_23, id_2[id_19]}-1'b0];
  module_2 modCall_1 (
      id_17,
      id_1
  );
  assign modCall_1.type_3 = 0;
endmodule

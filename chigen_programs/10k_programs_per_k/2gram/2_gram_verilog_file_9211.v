// Seed: 1280255927
module module_0 (
    input wor id_0,
    input wand id_1,
    input tri0 id_2,
    input tri0 id_3,
    output wand id_4,
    output uwire id_5,
    output wire id_6,
    output tri id_7,
    input tri0 id_8,
    output wire id_9,
    input wor id_10,
    input wor id_11,
    input supply0 id_12,
    input wor id_13,
    output wor id_14,
    input supply0 id_15,
    output tri1 id_16,
    input supply1 id_17,
    input tri0 id_18,
    input wor id_19,
    input tri1 id_20,
    output supply0 id_21,
    input tri0 id_22,
    input tri0 id_23,
    input wand id_24
);
endmodule
module module_1 (
    input wire id_0,
    output wand id_1,
    input tri1 id_2,
    output uwire id_3,
    input tri0 id_4,
    output supply0 id_5,
    input wor id_6,
    input supply0 id_7,
    output supply1 id_8,
    input uwire id_9,
    output wand id_10,
    input wor id_11,
    input tri0 id_12,
    input wand id_13,
    output wire id_14,
    input uwire id_15,
    inout uwire id_16,
    input tri0 id_17,
    output uwire id_18,
    input tri0 id_19,
    output wand id_20,
    input tri id_21,
    input tri0 id_22,
    input wire id_23,
    input supply0 id_24,
    input uwire id_25,
    output wand id_26,
    input supply0 id_27
);
  wire id_29;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_27,
      id_27,
      id_14,
      id_16,
      id_3,
      id_8,
      id_22,
      id_3,
      id_0,
      id_13,
      id_19,
      id_6,
      id_5,
      id_4,
      id_10,
      id_12,
      id_23,
      id_19,
      id_22,
      id_16,
      id_23,
      id_24,
      id_15
  );
  assign modCall_1.type_27 = 0;
  tri1 id_30;
  assign id_18 = id_30;
  tri id_31, id_32;
  if (1'b0) assign id_16 = 1;
  else begin : LABEL_0
    genvar id_33;
  end
  for (id_34 = !id_31; 1'd0; id_14 = 1) begin : LABEL_0
    id_35 :
    assert property (@(id_22 or id_11 + id_34) 1)
    else;
  end
endmodule

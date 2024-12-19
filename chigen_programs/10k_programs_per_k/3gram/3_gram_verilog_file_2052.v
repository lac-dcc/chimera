// Seed: 3807169567
module module_0 (
    input wand id_0,
    input tri id_1,
    input tri1 id_2,
    output tri0 id_3,
    input wor id_4,
    input tri0 id_5,
    input wor id_6,
    input wor id_7,
    output wor id_8,
    output supply1 id_9
);
  id_11(
      .id_0(), .id_1(1), .id_2(id_8)
  );
  reg id_12;
  always @(posedge !1) begin : LABEL_0
    if (1) id_8 = 1;
    else id_12 <= 1;
  end
endmodule
module module_1 (
    output supply0 id_0,
    input tri1 id_1,
    input uwire id_2,
    output tri1 id_3,
    input uwire id_4,
    output wor id_5,
    output uwire id_6#(
        .id_20(id_20),
        .id_21(id_20),
        .id_22(1'd0)
    ),
    input tri id_7,
    input wand id_8,
    input supply0 id_9,
    output wand id_10,
    input tri0 id_11,
    input tri0 id_12,
    output uwire id_13,
    output tri id_14,
    input uwire id_15,
    input wor id_16,
    output tri1 id_17,
    input tri1 id_18
);
  wire id_23;
  module_0 modCall_1 (
      id_2,
      id_11,
      id_2,
      id_10,
      id_11,
      id_12,
      id_7,
      id_2,
      id_6,
      id_10
  );
  assign modCall_1.id_2 = 0;
  supply0 id_24 = 1;
endmodule

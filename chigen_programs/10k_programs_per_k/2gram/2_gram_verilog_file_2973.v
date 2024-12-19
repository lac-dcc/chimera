// Seed: 1979555912
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    output tri0 id_2,
    input wor id_3,
    input tri0 id_4,
    output uwire id_5,
    output tri1 id_6,
    input supply0 id_7,
    input wand id_8,
    input tri id_9
);
endmodule
module module_1 (
    output tri1 id_0,
    input wire id_1,
    input tri0 id_2,
    input tri1 id_3,
    input tri0 id_4,
    output uwire id_5,
    output tri0 id_6,
    output supply1 id_7,
    output tri id_8,
    output tri1 id_9,
    output tri id_10
    , id_34,
    input supply1 id_11,
    input tri id_12,
    input uwire id_13,
    input uwire id_14,
    input wor id_15,
    input uwire id_16,
    output tri0 id_17#(
        .id_35((id_25 << 'b0)),
        .id_36(1)
    ),
    input tri0 id_18,
    input logic id_19,
    output wand id_20,
    input wand id_21,
    input tri0 id_22,
    output logic id_23,
    output wire id_24,
    input supply0 id_25,
    output logic id_26,
    output uwire id_27,
    output uwire id_28,
    input wire id_29,
    input wand id_30,
    output tri0 id_31,
    input wor id_32
);
  always begin : LABEL_0
    id_26 <= 1;
    if (1) begin : LABEL_0
      if (1) id_23 <= id_19;
    end
  end
  module_0 modCall_1 (
      id_22,
      id_29,
      id_5,
      id_25,
      id_30,
      id_27,
      id_27,
      id_16,
      id_11,
      id_21
  );
  assign modCall_1.id_8 = 0;
endmodule

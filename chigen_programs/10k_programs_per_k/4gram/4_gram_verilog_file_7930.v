// Seed: 3516986165
module module_0 ();
  final begin : LABEL_0
    id_1 <= 1;
  end
endmodule
module module_1 (
    output wor id_0,
    input supply0 id_1,
    output wor id_2,
    input uwire id_3,
    input tri0 id_4
    , id_23,
    input uwire id_5,
    input uwire id_6,
    input tri0 id_7,
    input wand id_8,
    input wor id_9
    , id_24,
    input supply1 id_10,
    inout tri0 id_11,
    input tri0 id_12,
    input tri0 id_13,
    input logic id_14,
    output tri1 id_15,
    input wor id_16,
    output tri1 id_17,
    output supply0 id_18,
    output logic id_19,
    input supply0 id_20,
    input wor id_21
);
  always_ff @(posedge 1) begin : LABEL_0
    cover (1'b0 && id_5);
    id_19 <= 1 - 1'b0;
  end
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  always #1 id_19 = id_14;
  id_25(
      .id_0(1'b0), .id_1(1'd0), .id_2(id_1)
  );
endmodule

// Seed: 154130104
module module_0 (
    input wand id_0,
    input tri0 id_1,
    input supply1 id_2,
    output uwire id_3
);
  logic [7:0] id_5;
  tri id_6;
  id_7(
      .id_0(id_2 ~^ 1),
      .id_1(id_3),
      .id_2(id_5[1'b0]),
      .id_3(id_6),
      .id_4(1),
      .id_5(1),
      .id_6(|id_6),
      .id_7(id_6)
  );
endmodule
module module_1 (
    input tri id_0,
    output logic id_1,
    input wand id_2,
    input uwire id_3,
    output supply0 id_4,
    input tri0 id_5,
    input tri0 id_6,
    input supply1 id_7,
    input supply0 id_8,
    input supply1 id_9,
    input supply0 id_10,
    input tri1 id_11,
    input wire id_12,
    input wire id_13,
    input tri0 id_14,
    output wire id_15,
    output wire id_16
);
  always @(1'b0 or negedge 1) begin : LABEL_0
    assert (id_2);
  end
  module_0 modCall_1 (
      id_6,
      id_11,
      id_3,
      id_16
  );
  assign modCall_1.id_2 = 0;
  assign id_1 = 1;
  initial id_1 <= 1 == 1;
endmodule

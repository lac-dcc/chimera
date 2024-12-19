// Seed: 3958929635
module module_0 (
    input tri id_0,
    input wor id_1,
    input uwire id_2,
    input supply1 id_3,
    input tri0 id_4,
    output wand id_5
);
  logic [7:0] id_7, id_8;
  wire id_9;
  wire id_10;
  id_11(
      .id_0(),
      .id_1(id_7[(1)]),
      .id_2(1),
      .id_3(1),
      .id_4(),
      .id_5(),
      .id_6(1),
      .id_7(id_2),
      .id_8(id_2),
      .id_9(),
      .id_10(id_3),
      .id_11(~(1)),
      .id_12({1, 1 ^ 1 <= 1}),
      .id_13(id_0),
      .id_14(1),
      .id_15(),
      .id_16(1),
      .id_17(id_10)
  );
endmodule
module module_1 (
    input tri0 id_0,
    input uwire id_1,
    output wand id_2,
    input wor id_3,
    input supply1 id_4,
    output wire id_5,
    input wor id_6,
    input logic id_7,
    input tri1 id_8,
    output supply0 id_9,
    output tri0 id_10,
    input wire id_11,
    input wire id_12,
    output wire id_13,
    input wire id_14,
    input tri0 id_15,
    input wor id_16,
    input tri0 id_17,
    input supply0 id_18,
    input supply0 id_19,
    input supply1 id_20,
    input supply1 id_21,
    output logic id_22,
    output wire id_23,
    output uwire id_24
);
  always #(1) begin : LABEL_0
    id_22 <= id_7;
  end
  module_0 modCall_1 (
      id_20,
      id_1,
      id_3,
      id_19,
      id_0,
      id_9
  );
  assign modCall_1.type_1 = 0;
endmodule

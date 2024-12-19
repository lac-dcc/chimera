// Seed: 959517521
module module_0 (
    input tri1 id_0,
    input wire id_1,
    input tri id_2,
    output uwire id_3,
    input tri0 id_4,
    input tri1 id_5,
    input tri0 id_6,
    output tri0 id_7,
    input tri1 id_8,
    input tri id_9,
    input supply1 id_10,
    output tri id_11,
    output uwire id_12,
    input uwire id_13,
    input wor id_14,
    output uwire id_15,
    input wor id_16,
    output tri id_17,
    input supply1 id_18,
    input tri0 id_19,
    output tri0 id_20,
    output wand id_21
);
  initial begin : LABEL_0
    id_3 = 1;
  end
endmodule
module module_1 (
    output tri0 id_0,
    input tri1 id_1,
    output wor id_2,
    output uwire id_3,
    input uwire id_4,
    input wire id_5,
    input logic id_6,
    output logic id_7,
    input wand id_8,
    output supply1 id_9,
    input supply1 id_10,
    input uwire id_11
);
  module_0 modCall_1 (
      id_10,
      id_4,
      id_8,
      id_0,
      id_1,
      id_5,
      id_5,
      id_9,
      id_11,
      id_8,
      id_10,
      id_0,
      id_3,
      id_1,
      id_10,
      id_0,
      id_5,
      id_0,
      id_8,
      id_10,
      id_2,
      id_0
  );
  assign modCall_1.type_3 = 0;
  assign id_0 = 1;
  assign id_7 = 1'd0;
  uwire id_13;
  always @(id_8 or 1) begin : LABEL_0
    if (1) begin : LABEL_0
      #1 id_3 = 1 == 1;
      #1 id_7 <= id_6;
    end
  end
  assign id_2 = id_1;
  id_14(
      .id_0(1),
      .id_1(id_6),
      .id_2(id_4),
      .id_3(id_0(id_3, ~{1, id_4}, 1, 1)),
      .id_4(id_0),
      .id_5(1 != 1'h0),
      .id_6(1),
      .id_7(id_10 >= 1),
      .id_8(id_0 == id_13),
      .id_9(1 | id_11),
      .id_10(id_3)
  );
endmodule

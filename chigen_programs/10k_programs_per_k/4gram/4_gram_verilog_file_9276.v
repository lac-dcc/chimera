// Seed: 1875323187
module module_0 (
    input uwire id_0,
    input wor id_1,
    input wire id_2,
    output supply1 id_3
    , id_24,
    input wand id_4,
    output wor id_5,
    input supply0 id_6,
    output uwire id_7,
    output uwire id_8,
    input supply0 id_9,
    input wire id_10,
    output wand id_11,
    input supply0 id_12,
    output tri0 id_13,
    output uwire id_14,
    input tri id_15,
    input supply1 id_16,
    output tri0 id_17,
    output supply0 id_18,
    input tri id_19,
    input supply1 module_0,
    input tri id_21,
    input supply1 id_22
);
  uwire id_25;
  assign id_17 = id_25;
endmodule
module module_1 (
    input tri0 id_0,
    input tri id_1,
    input tri0 id_2,
    input tri1 id_3,
    output tri1 id_4,
    input tri id_5,
    input wand id_6,
    input supply1 id_7,
    output tri id_8,
    output wire id_9
);
  id_11(
      .id_0(id_6),
      .id_1(id_0),
      .id_2(id_8),
      .id_3(id_5),
      .id_4(1),
      .id_5(),
      .id_6(1),
      .id_7(1),
      .id_8(1)
  );
  module_0 modCall_1 (
      id_2,
      id_7,
      id_1,
      id_9,
      id_7,
      id_9,
      id_6,
      id_8,
      id_9,
      id_6,
      id_3,
      id_8,
      id_6,
      id_4,
      id_4,
      id_3,
      id_3,
      id_8,
      id_4,
      id_3,
      id_0,
      id_2,
      id_3
  );
  assign modCall_1.type_27 = 0;
  always @(posedge 1) begin : LABEL_0
    deassign id_4;
  end
endmodule

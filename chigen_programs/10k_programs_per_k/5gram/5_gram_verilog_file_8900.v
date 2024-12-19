// Seed: 148041638
module module_0 (
    input supply1 id_0,
    input tri0 id_1,
    input supply0 id_2,
    input wand id_3,
    input wire id_4,
    output uwire id_5,
    input tri0 id_6,
    output tri1 id_7,
    output wand id_8,
    output uwire id_9,
    input wand id_10,
    output uwire id_11,
    input tri id_12,
    output tri1 id_13,
    output wand id_14,
    input tri id_15
    , id_25,
    input supply1 id_16,
    output supply0 id_17,
    input uwire id_18,
    input wire id_19,
    output wor id_20,
    output uwire id_21,
    input supply1 id_22,
    input wand id_23
);
  assign id_21#(
      .id_15(id_16 > id_3),
      .id_12(id_6 < id_15),
      .id_1 (id_16 | 1)
  ) = 1;
  wire id_26;
  assign module_1.type_5 = 0;
endmodule
module module_0 (
    input tri0 id_0,
    inout wand id_1,
    input wor id_2,
    output wor id_3
    , id_15,
    input supply0 id_4,
    input tri1 id_5,
    input uwire id_6,
    input wor id_7,
    output tri0 sample,
    output uwire id_9,
    input tri id_10,
    input tri0 module_1,
    output wand id_12,
    output wire id_13
);
  always_latch @(*) begin : LABEL_0
    cover (1);
  end
  module_0 modCall_1 (
      id_0,
      id_4,
      id_7,
      id_4,
      id_7,
      id_13,
      id_6,
      id_13,
      id_12,
      id_9,
      id_1,
      id_1,
      id_5,
      id_9,
      id_3,
      id_6,
      id_6,
      id_9,
      id_6,
      id_6,
      id_9,
      id_1,
      id_0,
      id_10
  );
endmodule

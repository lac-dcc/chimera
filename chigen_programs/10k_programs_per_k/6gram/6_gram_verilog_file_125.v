// Seed: 2459982470
module module_0 (
    input supply1 id_0,
    input wand id_1,
    input wire id_2,
    input tri id_3,
    input tri1 id_4,
    input wor id_5,
    output tri id_6,
    output supply1 id_7,
    input wand id_8,
    output wand id_9,
    input tri id_10
);
  wire id_12;
endmodule
module module_1 (
    input tri id_0,
    input tri0 id_1,
    input uwire id_2,
    input tri0 id_3,
    input uwire id_4,
    input tri1 id_5,
    input wand id_6,
    input supply0 id_7,
    output wire id_8,
    output logic id_9,
    input tri id_10,
    input uwire id_11,
    input supply1 id_12,
    output tri id_13,
    input supply1 id_14,
    input supply1 id_15,
    output wand id_16,
    input wire id_17,
    output supply0 id_18,
    input wand id_19,
    input tri0 id_20,
    input uwire id_21,
    input supply0 id_22,
    input wor id_23,
    input wand id_24
);
  supply1 id_26, id_27;
  module_0 modCall_1 (
      id_20,
      id_11,
      id_10,
      id_11,
      id_12,
      id_19,
      id_16,
      id_13,
      id_10,
      id_13,
      id_17
  );
  assign modCall_1.type_13 = 0;
  assign id_27 = 1'b0;
  xor primCall (
      id_9,
      id_5,
      id_3,
      id_0,
      id_7,
      id_27,
      id_15,
      id_6,
      id_22,
      id_1,
      id_21,
      id_23,
      id_10,
      id_12,
      id_2,
      id_26,
      id_14,
      id_24,
      id_19,
      id_11,
      id_4
  );
  always @(id_5) begin : LABEL_0
    if (id_7) begin : LABEL_0
      id_9 <= 1;
    end
  end
  id_28(
      .id_0(1), .id_1(id_15 - 1'b0), .id_2(1)
  );
endmodule

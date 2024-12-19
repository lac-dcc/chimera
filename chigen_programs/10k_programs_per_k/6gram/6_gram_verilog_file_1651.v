// Seed: 175081396
module module_0 (
    output supply1 id_0,
    input uwire id_1,
    input wand id_2,
    input wand id_3,
    input wand id_4,
    input tri0 id_5,
    input wor id_6,
    output tri0 id_7,
    input wand id_8,
    input uwire id_9,
    output uwire id_10,
    output wor id_11
);
  id_13(
      .id_0(id_0), .id_1(1), .id_2(1 - 1), .id_3(id_0), .id_4(1 != id_2), .id_5(1)
  );
  assign module_1.id_15 = 0;
endmodule
module module_1 (
    output tri id_0,
    input tri0 id_1,
    output supply0 id_2,
    input wand id_3,
    input uwire id_4,
    output tri1 id_5,
    input wire id_6,
    output tri1 id_7,
    input tri1 id_8,
    input tri1 id_9,
    input wire id_10,
    input uwire id_11
    , id_27,
    output wor id_12,
    output wire id_13,
    input wand id_14,
    input uwire id_15,
    input supply1 id_16,
    output tri id_17,
    output supply0 id_18,
    input tri0 id_19,
    input tri1 id_20,
    input supply1 id_21,
    output logic id_22,
    input wire id_23,
    output wand id_24,
    output tri id_25
);
  genvar id_28, id_29;
  always @(1) begin : LABEL_0
    id_22 <= 1;
  end
  id_30(
      .id_0(1'b0)
  );
  module_0 modCall_1 (
      id_0,
      id_15,
      id_3,
      id_11,
      id_3,
      id_16,
      id_16,
      id_12,
      id_10,
      id_15,
      id_5,
      id_7
  );
endmodule

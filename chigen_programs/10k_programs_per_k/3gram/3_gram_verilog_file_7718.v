// Seed: 1417842280
module module_0 (
    input wor id_0,
    input wand id_1,
    output supply1 id_2,
    output tri0 id_3,
    input uwire id_4,
    input wand id_5,
    output supply0 id_6,
    output tri id_7,
    output wire id_8,
    input wand id_9,
    input tri0 id_10
);
  assign id_7 = 1;
  reg id_12;
  id_13(
      .id_0(id_10), .id_1(id_3)
  );
  always #1 begin : LABEL_0
    id_14();
    if (1) begin : LABEL_0
      id_12 <= 1;
    end
  end
  assign module_1.type_33 = 0;
endmodule
module module_1 (
    output tri id_0,
    output supply1 id_1,
    input supply0 id_2,
    input uwire id_3,
    input tri id_4,
    input supply0 id_5,
    input supply1 id_6,
    input tri0 id_7,
    input uwire id_8
    , id_28,
    input tri1 id_9,
    input wor id_10,
    input supply1 id_11,
    input uwire id_12,
    input wor id_13,
    input supply1 id_14,
    output tri id_15,
    input wor id_16,
    input wand id_17,
    input tri id_18,
    output tri1 id_19,
    output uwire id_20,
    output wire id_21,
    input wand id_22,
    output logic id_23,
    input tri id_24,
    output uwire id_25,
    input supply0 id_26
);
  always @(1) begin : LABEL_0
    id_23 <= id_26 && 1;
  end
  module_0 modCall_1 (
      id_8,
      id_22,
      id_25,
      id_1,
      id_6,
      id_18,
      id_1,
      id_20,
      id_20,
      id_26,
      id_16
  );
endmodule

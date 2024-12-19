// Seed: 3973138216
module module_0 (
    input tri0 id_0,
    input wire id_1,
    input supply1 id_2,
    input tri0 id_3,
    output tri0 id_4,
    input tri id_5,
    output supply0 id_6,
    input wor id_7,
    output supply1 id_8,
    output supply0 id_9,
    input supply0 id_10,
    output wor id_11,
    input wor id_12,
    output wire id_13,
    input supply0 id_14,
    input tri0 id_15,
    input wire id_16,
    input tri id_17,
    output wor id_18,
    output supply1 id_19,
    input tri1 id_20
);
  always begin : LABEL_0
    if (1) begin : LABEL_0
      id_19 = id_1;
    end
  end
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    output uwire id_0#(
        .id_15(!id_1),
        .id_16(1),
        .id_17(1),
        .id_18(1)
    ),
    input tri id_1,
    input wire id_2,
    input uwire id_3,
    input uwire id_4,
    output uwire id_5,
    output uwire id_6,
    output wire id_7,
    output wand id_8,
    input wand id_9,
    input uwire id_10,
    input wand id_11,
    input tri0 id_12,
    output supply1 id_13
);
  module_0 modCall_1 (
      id_4,
      id_2,
      id_4,
      id_2,
      id_13,
      id_3,
      id_6,
      id_10,
      id_6,
      id_5,
      id_2,
      id_5,
      id_1,
      id_7,
      id_10,
      id_11,
      id_3,
      id_10,
      id_8,
      id_6,
      id_9
  );
  always id_16[^1] <= #(id_9 & id_12) 1;
  assign id_13 = 1;
endmodule

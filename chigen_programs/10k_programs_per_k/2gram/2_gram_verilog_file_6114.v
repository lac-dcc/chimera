// Seed: 2488092167
module module_0 (
    input wor id_0,
    input wire id_1,
    input wand id_2,
    input tri1 id_3,
    input uwire id_4,
    output tri id_5,
    input tri0 id_6,
    output tri id_7,
    input supply1 id_8,
    output tri0 id_9,
    input wand id_10,
    input tri0 id_11,
    input uwire id_12,
    output tri id_13,
    output wor id_14,
    input supply1 id_15,
    output tri id_16,
    input supply1 id_17,
    input tri0 id_18,
    input wire id_19,
    input tri0 id_20,
    input tri1 id_21,
    input wire id_22,
    output wand id_23,
    output tri id_24,
    output tri id_25,
    input wire id_26,
    input uwire id_27,
    output wor id_28,
    output wor id_29,
    input tri id_30,
    output uwire id_31,
    output tri0 id_32
);
endmodule
module module_1 (
    input wand id_0,
    output logic id_1,
    output tri1 id_2,
    input wire id_3,
    output logic id_4,
    input supply0 id_5,
    input uwire id_6
);
  assign id_2 = id_5;
  always begin : LABEL_0
    case (1)
      id_3: begin : LABEL_1
        if (-1) id_4 <= id_5;
      end
      id_5: begin : LABEL_2
        id_1 <= id_5;
      end
    endcase
  end
  assign id_1 = 1;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_6,
      id_0,
      id_5,
      id_2,
      id_5,
      id_2,
      id_0,
      id_2,
      id_3,
      id_0,
      id_6,
      id_2,
      id_2,
      id_6,
      id_2,
      id_3,
      id_3,
      id_6,
      id_3,
      id_3,
      id_6,
      id_2,
      id_2,
      id_2,
      id_5,
      id_5,
      id_2,
      id_2,
      id_5,
      id_2,
      id_2
  );
  assign modCall_1.id_17 = 0;
endmodule

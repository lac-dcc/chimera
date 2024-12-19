// Seed: 1259149532
module module_0 (
    input tri id_0,
    output supply1 id_1,
    input wire id_2,
    input supply0 id_3
);
  wire id_5;
  wire id_6;
  assign module_1.id_7 = 0;
endmodule
module module_0 (
    input uwire id_0,
    input wire id_1,
    input logic module_1,
    input tri1 id_3,
    output supply0 id_4,
    input supply1 id_5,
    input wire id_6,
    input wand id_7,
    output supply1 id_8,
    output wand id_9,
    input tri id_10,
    input uwire id_11,
    input supply1 id_12,
    input uwire id_13,
    output wand id_14,
    input tri1 id_15,
    output logic id_16,
    output supply1 id_17,
    output supply0 id_18,
    input wor id_19,
    input tri1 id_20,
    input logic id_21,
    input supply0 id_22,
    output wand id_23,
    input wand id_24,
    output wor id_25,
    input tri0 id_26,
    input uwire id_27,
    input wor id_28
);
  always @(*) begin : LABEL_0
    id_16 <= id_21;
    if (id_2)
      if (1 - id_26) id_16 <= 1;
      else begin : LABEL_0
        id_14 = 1;
      end
    id_16 = id_2;
  end
  and primCall (
      id_18,
      id_13,
      id_7,
      id_6,
      id_5,
      id_19,
      id_12,
      id_20,
      id_0,
      id_26,
      id_24,
      id_15,
      id_3,
      id_10,
      id_21,
      id_22,
      id_27,
      id_11,
      id_28
  );
  module_0 modCall_1 (
      id_3,
      id_23,
      id_26,
      id_1
  );
endmodule

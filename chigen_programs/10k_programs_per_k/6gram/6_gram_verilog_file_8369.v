// Seed: 1802937296
module module_0 (
    input wand id_0
    , id_3,
    output supply0 id_1
);
endmodule
module module_1 (
    input tri id_0,
    input tri id_1,
    input uwire id_2,
    input wor id_3,
    input wor id_4,
    input uwire id_5,
    input uwire id_6,
    input supply1 id_7,
    output wire id_8,
    input wire id_9,
    input tri1 id_10,
    input supply1 id_11,
    input uwire id_12,
    input tri1 id_13,
    input tri id_14,
    input supply0 id_15,
    input wand id_16,
    input uwire id_17,
    input tri id_18,
    input wand id_19,
    output wire id_20,
    input wor id_21,
    input supply0 id_22,
    input supply1 id_23,
    output logic id_24,
    input wand id_25
);
  module_0 modCall_1 (
      id_2,
      id_8
  );
  localparam id_27 = 1 & 1 == 1;
  nand primCall (
      id_8,
      id_17,
      id_1,
      id_22,
      id_14,
      id_4,
      id_12,
      id_23,
      id_25,
      id_5,
      id_21,
      id_19,
      id_13,
      id_16,
      id_7,
      id_0,
      id_11,
      id_9,
      id_15,
      id_3
  );
  wire id_28;
  always @(posedge (-1) ^ 1 or posedge id_16)
    if (id_27) begin : LABEL_0
      id_24 <= id_2;
    end
endmodule

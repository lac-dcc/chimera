// Seed: 4061790462
module module_0 (
    input uwire id_0,
    input uwire id_1,
    input supply0 id_2,
    input wire id_3,
    input tri0 id_4,
    output wand id_5,
    input wand id_6,
    input tri0 id_7,
    input wire id_8,
    input wand id_9,
    input tri0 id_10,
    input wor id_11,
    output wand id_12,
    input uwire id_13,
    input supply1 id_14,
    input supply0 id_15,
    input wand id_16
);
  assign id_12 = 1 & 1;
  always @(*) repeat (1) #1;
endmodule
module module_1 (
    output uwire id_0,
    input tri0 id_1,
    output tri id_2,
    input tri0 id_3,
    input wand id_4
    , id_26,
    output logic id_5,
    input wire id_6,
    input wor id_7,
    input tri0 id_8,
    input wand id_9,
    output supply0 id_10,
    output wor id_11,
    output tri1 id_12,
    input uwire id_13,
    input wor id_14,
    input tri0 id_15,
    output wor id_16,
    output uwire id_17
    , id_27,
    input tri1 id_18,
    output tri id_19,
    input supply0 id_20,
    input wire id_21,
    output tri0 id_22,
    input wor id_23,
    output wand id_24
);
  assign id_24 = ~id_23;
  always @(posedge 1'd0) begin : LABEL_0
    id_26 <= id_14 > 1;
    id_5  <= 1;
  end
  module_0 modCall_1 (
      id_20,
      id_4,
      id_14,
      id_14,
      id_14,
      id_19,
      id_8,
      id_14,
      id_15,
      id_7,
      id_20,
      id_1,
      id_17,
      id_1,
      id_8,
      id_4,
      id_6
  );
  assign modCall_1.id_11 = 0;
endmodule

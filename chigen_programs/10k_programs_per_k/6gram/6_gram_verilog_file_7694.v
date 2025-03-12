// Seed: 3513356537
module module_0 (
    input wor id_0,
    input tri id_1,
    output wor id_2,
    input uwire id_3,
    output uwire id_4,
    input wand id_5
    , id_17,
    input tri0 id_6,
    input wor id_7,
    output supply0 id_8,
    input tri id_9,
    output tri id_10,
    input wand id_11,
    input wand id_12,
    input supply1 id_13,
    input supply0 id_14,
    output wand id_15
);
  assign id_2 = id_5;
endmodule
module module_0 #(
    parameter id_16 = 32'd12
) (
    output uwire id_0,
    input wand id_1,
    input tri1 id_2,
    input wire id_3,
    input tri1 module_1,
    input tri1 id_5,
    input wand id_6,
    input wor id_7,
    input tri1 id_8,
    output supply1 id_9,
    input supply0 id_10,
    output tri0 id_11,
    output wand id_12,
    input wire id_13,
    output logic id_14,
    input supply1 id_15,
    input tri _id_16,
    output wor id_17
);
  assign id_9 = 1;
  logic id_19;
  ;
  wire id_20;
  assign id_11 = id_2;
  wire id_21;
  bit  id_22 = -1;
  module_0 modCall_1 (
      id_15,
      id_1,
      id_11,
      id_3,
      id_11,
      id_6,
      id_6,
      id_15,
      id_9,
      id_15,
      id_12,
      id_5,
      id_10,
      id_2,
      id_6,
      id_0
  );
  logic [id_16 : -1] id_23;
  ;
  nand primCall (
      id_0,
      id_8,
      id_22,
      id_13,
      id_20,
      id_5,
      id_10,
      id_1,
      id_21,
      id_7,
      id_3,
      id_15,
      id_2,
      id_19,
      id_6
  );
  initial begin : LABEL_0
    id_14 = 1'b0;
    id_22 <= 1 - id_10;
  end
endmodule

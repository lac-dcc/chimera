// Seed: 874751990
module module_0 (
    output wor id_0,
    output wire id_1,
    input wire id_2,
    input uwire id_3,
    output supply0 id_4,
    input supply0 id_5,
    input wor id_6,
    output supply1 id_7,
    output tri1 id_8,
    input wand id_9,
    input supply0 id_10,
    input supply0 id_11,
    output wor id_12
    , id_18,
    input tri id_13,
    input tri id_14,
    input wor id_15,
    output supply0 id_16
);
  assign id_16 = id_3;
  assign module_1.id_14 = 0;
endmodule
module module_1 #(
    parameter id_5 = 32'd36
) (
    output tri1 id_0,
    input wand id_1,
    output wand id_2,
    input supply0 id_3,
    input tri0 id_4,
    input uwire _id_5,
    input wand id_6,
    input uwire id_7,
    input tri1 id_8,
    input wor id_9,
    output logic id_10,
    output tri0 id_11,
    output tri0 id_12
    , id_21,
    input uwire id_13[id_5 : -1],
    input tri id_14,
    input uwire id_15,
    input supply1 id_16,
    output tri0 id_17,
    output logic id_18,
    input wire id_19
);
  initial begin : LABEL_0
    fork
      id_18 = 1'b0;
      id_10 = -1'b0;
    join
  end
  logic \id_22 ;
  assign id_10 = -1;
  logic id_23, id_24, id_25;
  module_0 modCall_1 (
      id_11,
      id_17,
      id_19,
      id_4,
      id_11,
      id_15,
      id_13,
      id_2,
      id_0,
      id_9,
      id_19,
      id_9,
      id_11,
      id_8,
      id_6,
      id_9,
      id_17
  );
endmodule

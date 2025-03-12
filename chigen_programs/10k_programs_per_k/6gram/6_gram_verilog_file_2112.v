// Seed: 843853098
module module_0 (
    input supply0 id_0,
    input supply0 id_1,
    input supply0 id_2,
    input wor id_3,
    output wor id_4,
    input supply1 id_5,
    input wor id_6,
    input wand id_7,
    output wor id_8,
    output supply0 id_9,
    input wor id_10,
    output uwire id_11
);
  wand id_13 = -1;
  bit  id_14;
  assign module_1.id_8 = 0;
  generate
    for (id_15 = id_3#(.id_6(1)); id_5; id_14 = -1 - id_1) begin : LABEL_0
      wire id_16;
    end
  endgenerate
endmodule
module module_1 #(
    parameter id_14 = 32'd78,
    parameter id_8  = 32'd57
) (
    output tri1 id_0,
    input supply1 id_1,
    output tri id_2,
    input wire id_3,
    input wand id_4,
    input wor id_5,
    input tri1 id_6,
    input tri0 id_7,
    input tri _id_8,
    output tri id_9,
    input wire id_10,
    input wire id_11,
    input wand id_12,
    input wand id_13,
    input tri0 _id_14,
    input wand id_15,
    input wire id_16,
    input supply0 id_17,
    output logic id_18
);
  integer [id_14 : id_8] id_20 = -1;
  module_0 modCall_1 (
      id_3,
      id_17,
      id_5,
      id_3,
      id_2,
      id_13,
      id_3,
      id_10,
      id_2,
      id_2,
      id_4,
      id_9
  );
  initial id_18 = #1 1'b0;
  logic id_21;
  ;
endmodule

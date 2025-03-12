// Seed: 2632734392
module module_0 (
    input supply1 id_0,
    input uwire id_1,
    output supply0 id_2,
    input tri0 id_3,
    input supply1 id_4,
    input tri0 id_5,
    input wor id_6,
    output supply0 id_7,
    input supply1 id_8,
    output supply0 id_9,
    output wand id_10,
    input wire id_11,
    input wire id_12,
    input supply1 id_13
);
  assign id_2 = 1'b0 - id_4;
  assign id_7 = -1;
endmodule
module module_1 #(
    parameter id_0 = 32'd93
) (
    input supply1 _id_0,
    input tri0 id_1,
    input supply1 id_2,
    inout uwire id_3,
    input wire id_4,
    input supply0 id_5,
    input wire id_6,
    output wor id_7,
    input supply1 id_8,
    input supply1 id_9,
    input supply0 id_10,
    input supply0 id_11,
    output uwire id_12,
    input tri id_13,
    output tri1 id_14,
    output tri id_15,
    output supply0 id_16,
    input uwire id_17,
    input wand id_18,
    output wand id_19,
    input uwire id_20,
    input tri0 id_21,
    output wor id_22
);
  wire [id_0 : -1] id_24;
  parameter [-1 : 1 'b0] id_25 = 1;
  nor primCall (
      id_12,
      id_17,
      id_9,
      id_18,
      id_25,
      id_21,
      id_13,
      id_6,
      id_11,
      id_10,
      id_4,
      id_1,
      id_5,
      id_24,
      id_3,
      id_20
  );
  module_0 modCall_1 (
      id_20,
      id_4,
      id_14,
      id_5,
      id_17,
      id_17,
      id_21,
      id_15,
      id_8,
      id_16,
      id_19,
      id_9,
      id_8,
      id_2
  );
  wire [1 'b0 +  1 : -1 'b0] id_26;
endmodule

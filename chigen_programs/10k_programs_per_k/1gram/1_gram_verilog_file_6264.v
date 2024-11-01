// Seed: 4268531038
module module_0 (
    output logic id_0,
    input wire id_1,
    input uwire id_2,
    input uwire id_3,
    input tri0 id_4,
    input wor id_5,
    output tri1 id_6,
    output wand id_7,
    input supply1 id_8,
    output supply1 id_9,
    output supply1 id_10,
    input wand id_11,
    input tri0 id_12,
    output tri1 id_13,
    input wire id_14,
    input tri1 id_15,
    input tri0 id_16,
    input uwire id_17,
    output uwire id_18,
    input tri id_19
);
  assign id_13.id_2 = 1;
  always id_0 <= 1;
  assign id_6.id_3 = 1;
  wire id_21;
endmodule
module module_1 #(
    parameter id_23 = 32'd71
) (
    input wor id_0,
    output tri id_1,
    output tri0 id_2,
    input uwire id_3
    , id_21,
    input tri1 id_4,
    input tri1 id_5,
    output wand id_6,
    input tri1 id_7,
    input tri0 id_8,
    output wor id_9,
    input wor id_10,
    input supply1 id_11,
    input tri0 id_12,
    input uwire id_13,
    input logic id_14,
    input wire id_15,
    output logic id_16,
    input supply1 id_17,
    input tri1 id_18,
    output uwire id_19
);
  always id_16 <= {1{id_14}};
  wire id_22;
  module_0(
      id_16,
      id_10,
      id_8,
      id_4,
      id_0,
      id_11,
      id_2,
      id_2,
      id_17,
      id_9,
      id_9,
      id_8,
      id_10,
      id_9,
      id_8,
      id_15,
      id_10,
      id_10,
      id_1,
      id_18
  ); defparam id_23 = id_15 & id_18;
  and (
      id_9,
      id_10,
      id_8,
      id_3,
      id_4,
      id_11,
      id_5,
      id_13,
      id_12,
      id_21,
      id_22,
      id_0,
      id_14,
      id_17,
      id_7,
      id_15
  );
endmodule

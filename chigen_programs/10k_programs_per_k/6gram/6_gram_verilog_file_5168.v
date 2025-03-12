// Seed: 963788403
module module_0 (
    input wor id_0,
    output wand id_1,
    input tri0 id_2,
    output tri0 id_3,
    input wand id_4,
    input uwire id_5,
    input tri0 id_6,
    input wire id_7,
    input tri0 id_8,
    input wire id_9,
    input wor id_10,
    input wor id_11,
    input supply0 id_12,
    input wor id_13,
    input wor id_14,
    output supply0 id_15,
    input tri1 id_16,
    output supply1 id_17,
    input tri id_18
    , id_21,
    output logic id_19
);
  wire  id_22;
  wire  id_23;
  logic id_24;
  always @(posedge 1) id_19 = id_24;
  assign id_1 = 1;
  assign module_1.id_8 = 0;
endmodule
module module_1 #(
    parameter id_9 = 32'd22
) (
    output tri1 id_0,
    output uwire id_1,
    input tri1 id_2
    , id_14,
    input wire id_3,
    input tri0 id_4,
    output logic id_5,
    output tri0 id_6,
    input tri0 id_7,
    input supply1 id_8,
    input tri0 _id_9,
    output tri0 id_10,
    output wand id_11,
    output wand id_12
);
  logic [-1 : -1  /  id_9] id_15 = -1;
  module_0 modCall_1 (
      id_7,
      id_10,
      id_4,
      id_6,
      id_4,
      id_8,
      id_3,
      id_4,
      id_3,
      id_2,
      id_4,
      id_2,
      id_3,
      id_2,
      id_8,
      id_12,
      id_7,
      id_1,
      id_3,
      id_5
  );
  logic id_16 = id_3;
  initial id_5 = -1;
endmodule

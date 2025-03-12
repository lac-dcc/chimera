// Seed: 1145837974
module module_0 (
    output uwire id_0,
    output wire id_1,
    input uwire id_2,
    output tri1 id_3,
    output tri0 id_4,
    input uwire id_5,
    input wire id_6,
    output tri0 id_7,
    output uwire id_8,
    input wor id_9,
    output tri0 id_10,
    input wor id_11,
    input uwire id_12,
    input tri1 id_13
    , id_17,
    output wor id_14,
    input supply0 id_15
);
  assign id_8 = id_2;
  assign module_1.id_17 = 0;
endmodule
module module_1 #(
    parameter id_17 = 32'd62,
    parameter id_5  = 32'd25
) (
    input wire id_0,
    input wor id_1,
    input tri1 id_2,
    input tri1 id_3,
    output logic id_4,
    input supply1 _id_5,
    input supply1 id_6,
    inout supply1 id_7,
    output wire id_8,
    input wire id_9
    , id_16,
    input tri id_10,
    input wire id_11
    , _id_17,
    input wand id_12,
    output tri0 id_13,
    input uwire id_14
);
  assign id_4 = -1;
  wire id_18[id_5 : id_17];
  module_0 modCall_1 (
      id_7,
      id_13,
      id_14,
      id_8,
      id_13,
      id_2,
      id_11,
      id_13,
      id_13,
      id_14,
      id_8,
      id_6,
      id_6,
      id_10,
      id_7,
      id_11
  );
  always @(*) id_4 = -1;
endmodule

// Seed: 1743241722
module module_0 (
    input uwire id_0,
    output supply0 id_1,
    output uwire id_2,
    input tri id_3,
    output uwire id_4,
    input wire id_5,
    input wor id_6,
    input uwire id_7,
    output wire id_8,
    input wand id_9,
    output supply1 id_10,
    input tri0 id_11,
    output wire id_12,
    input tri id_13
);
  wire id_15, id_16;
  logic id_17;
  wire  id_18;
  ;
endmodule
module module_1 #(
    parameter id_17 = 32'd45,
    parameter id_21 = 32'd14
) (
    output logic id_0,
    input wor id_1,
    input wor id_2,
    output wand id_3,
    input uwire id_4,
    output supply1 id_5,
    input supply1 id_6,
    input tri1 id_7,
    input wor id_8,
    output tri0 id_9,
    input uwire id_10,
    input tri id_11,
    output wor id_12,
    output wor id_13
    , id_20, _id_21,
    input uwire id_14,
    input wor id_15,
    input supply1 id_16,
    output tri0 _id_17,
    output wor id_18
);
  module_0 modCall_1 (
      id_4,
      id_13,
      id_12,
      id_4,
      id_3,
      id_6,
      id_4,
      id_14,
      id_9,
      id_8,
      id_9,
      id_15,
      id_13,
      id_6
  );
  assign modCall_1.id_9 = 0;
  assign id_13 = -1;
  wire id_22[id_21 : id_17];
  always #(1) id_0 <= 1;
endmodule

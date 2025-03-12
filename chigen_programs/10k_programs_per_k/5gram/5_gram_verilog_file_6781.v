// Seed: 3618661554
module module_0 (
    input supply1 id_0,
    output wor id_1,
    input wor id_2,
    input wand id_3,
    output tri0 id_4,
    input tri id_5,
    input wand id_6,
    output tri id_7,
    input wire id_8,
    input supply0 id_9,
    output supply1 id_10,
    output supply1 id_11,
    output tri id_12,
    output wand id_13,
    input supply0 id_14,
    input wire id_15,
    output uwire id_16,
    input uwire id_17,
    input supply0 id_18,
    input wor id_19,
    input wand id_20
);
  wire id_22;
  ;
  assign id_13 = id_2;
  assign id_1  = {1, -1};
  assign id_7  = id_8;
endmodule
module module_1 (
    output uwire id_0,
    input tri id_1,
    input wor id_2,
    input wor id_3,
    output uwire id_4,
    input uwire id_5,
    input uwire id_6,
    input wand id_7,
    output wire id_8,
    input wor id_9,
    output supply0 id_10
);
  assign id_8 = -1;
  localparam id_12 = 1;
  wire id_13;
  assign id_10 = id_5;
  module_0 modCall_1 (
      id_7,
      id_10,
      id_1,
      id_5,
      id_8,
      id_9,
      id_7,
      id_10,
      id_6,
      id_5,
      id_10,
      id_0,
      id_0,
      id_8,
      id_5,
      id_7,
      id_0,
      id_9,
      id_7,
      id_2,
      id_6
  );
  assign modCall_1.id_18 = 0;
endmodule

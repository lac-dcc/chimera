// Seed: 912106671
module module_0 (
    output tri id_0,
    input uwire id_1,
    input tri id_2,
    output wire id_3,
    input tri0 id_4,
    input tri0 id_5,
    input tri1 id_6,
    input wire id_7,
    output tri1 id_8,
    input supply1 id_9,
    input tri0 id_10,
    output wor id_11,
    input wire id_12,
    input wand id_13,
    output tri0 id_14
);
  parameter [-1 : 1] id_16 = -1;
  wire id_17;
  wire id_18;
  wand id_19 = 1;
endmodule
module module_1 #(
    parameter id_9 = 32'd93
) (
    output uwire id_0,
    output supply0 id_1,
    output wire id_2,
    input uwire id_3
    , id_15,
    output tri1 id_4,
    output tri0 id_5,
    output wor id_6,
    input tri1 id_7,
    input uwire id_8,
    input tri _id_9,
    input wire id_10,
    input tri id_11,
    output supply1 id_12,
    output wand id_13
);
  logic [{  -1  {  1  }  } : -1] id_16;
  logic [$realtime : id_9] id_17;
  assign id_6 = {-1{-1}};
  module_0 modCall_1 (
      id_5,
      id_10,
      id_10,
      id_4,
      id_8,
      id_3,
      id_11,
      id_3,
      id_0,
      id_11,
      id_7,
      id_5,
      id_8,
      id_10,
      id_1
  );
  always @(negedge id_17) while (id_17) $unsigned(21);
  ;
endmodule

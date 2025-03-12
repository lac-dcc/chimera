// Seed: 1178684136
module module_0 (
    input tri0 id_0,
    output tri id_1,
    output uwire id_2,
    input wire id_3,
    output tri0 id_4,
    output tri id_5,
    input tri1 id_6,
    output wire id_7,
    input tri1 id_8,
    input supply1 id_9,
    input tri0 id_10
    , id_19,
    input wor id_11,
    input wire id_12,
    input wand id_13,
    input tri0 id_14,
    output wand id_15,
    input tri0 id_16,
    input uwire id_17
);
  wire  id_20;
  logic id_21;
  wire  id_22;
  ;
  localparam id_23 = 1;
  localparam id_24 = 1;
endmodule
module module_1 #(
    parameter id_4 = 32'd31,
    parameter id_9 = 32'd81
) (
    output wand id_0,
    output wand id_1,
    input tri0 id_2,
    input wand id_3,
    input tri1 _id_4,
    input tri id_5,
    output tri0 id_6,
    output tri0 id_7
    , \id_13 ,
    input supply0 id_8,
    input tri1 _id_9,
    output wor id_10,
    output tri id_11
);
  localparam id_14 = 1;
  wire [id_4 : id_9] id_15;
  module_0 modCall_1 (
      id_5,
      id_10,
      id_7,
      id_3,
      id_10,
      id_11,
      id_8,
      id_11,
      id_5,
      id_3,
      id_3,
      id_3,
      id_5,
      id_3,
      id_3,
      id_11,
      id_8,
      id_8
  );
  assign modCall_1.id_9 = 0;
  wire id_16;
endmodule

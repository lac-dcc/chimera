// Seed: 1143635926
module module_0 (
    input tri1 id_0,
    input wor id_1
    , id_20,
    input tri1 id_2,
    input wand id_3,
    input uwire id_4,
    input supply0 id_5,
    input tri1 id_6,
    input wor id_7,
    output uwire id_8,
    input tri0 id_9,
    output supply0 id_10,
    input tri1 id_11,
    input supply1 id_12,
    output uwire id_13,
    input uwire id_14,
    output uwire id_15,
    output wire id_16,
    input tri1 id_17,
    input wand id_18
);
  assign id_8 = 1;
  wire id_21;
  assign id_15 = 1;
  localparam id_22 = 1;
  wire id_23;
endmodule
module module_1 #(
    parameter id_6 = 32'd93
) (
    input supply1 id_0,
    input tri id_1,
    input supply0 id_2,
    output supply1 id_3,
    input wand id_4
    , id_12,
    input supply1 id_5,
    output supply0 _id_6,
    input wor id_7,
    output tri1 id_8,
    input tri id_9,
    input wand id_10
);
  logic [id_6 : 1] id_13;
  ;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_9,
      id_4,
      id_5,
      id_4,
      id_4,
      id_7,
      id_3,
      id_0,
      id_3,
      id_1,
      id_4,
      id_3,
      id_10,
      id_8,
      id_3,
      id_4,
      id_4
  );
  assign modCall_1.id_1 = 0;
endmodule

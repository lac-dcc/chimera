// Seed: 506958486
module module_0 (
    input uwire id_0,
    input tri id_1,
    input supply0 id_2,
    output wand id_3,
    input tri0 id_4,
    input wand id_5,
    input tri id_6,
    output tri id_7,
    input tri0 id_8,
    input tri1 id_9,
    input wire id_10,
    output tri1 id_11,
    input wand id_12,
    output wor id_13,
    output supply0 id_14,
    input tri id_15
);
  assign module_1.id_4 = 0;
  wire id_17;
  ;
  assign id_13 = id_17;
endmodule
module module_1 #(
    parameter id_1 = 32'd61,
    parameter id_3 = 32'd71
) (
    input tri id_0,
    output wire _id_1,
    input wor id_2,
    input wor _id_3,
    input uwire id_4,
    input wire id_5,
    output supply1 id_6
);
  integer id_8;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_4,
      id_6,
      id_0,
      id_5,
      id_5,
      id_6,
      id_4,
      id_2,
      id_5,
      id_6,
      id_2,
      id_6,
      id_6,
      id_0
  );
  logic [id_1 : id_1] id_9;
  wire id_10;
  logic id_11;
  wire [-1 : 1] id_12;
  assign id_8 = id_8[{-1'b0+1{id_3}} : 1];
endmodule

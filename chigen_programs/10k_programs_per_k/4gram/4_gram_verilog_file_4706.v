// Seed: 261627417
module module_0 (
    input tri1 id_0,
    output tri id_1,
    output wor id_2,
    input wand id_3,
    output uwire id_4,
    input supply0 id_5,
    input supply0 id_6,
    output wire id_7,
    output tri1 id_8,
    output supply1 id_9
);
  wire  id_11;
  logic id_12;
  ;
  localparam id_13 = -1;
  parameter id_14 = id_13;
endmodule
module module_1 #(
    parameter id_11 = 32'd74,
    parameter id_3  = 32'd35,
    parameter id_6  = 32'd27,
    parameter id_7  = 32'd87,
    parameter id_8  = 32'd42
) (
    output wire id_0,
    input tri1 id_1,
    output wand id_2,
    output wire _id_3,
    input uwire id_4,
    input wor id_5,
    input uwire _id_6,
    output wor _id_7,
    input wire _id_8,
    input supply0 id_9
);
  assign id_2 = 1;
  logic _id_11;
  ;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_2,
      id_1,
      id_0,
      id_4,
      id_5,
      id_0,
      id_2,
      id_0
  );
  assign modCall_1.id_5 = 0;
  wire [id_8 : id_6] id_12;
  logic [id_3 : id_7] id_13[id_3 : id_11];
  wire id_14;
  wire id_15;
  wire id_16;
  wire id_17;
endmodule

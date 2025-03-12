// Seed: 866125575
module module_0 (
    output wand id_0,
    input tri id_1,
    input wor id_2,
    input supply1 id_3,
    input supply0 id_4,
    input tri1 id_5,
    output tri id_6,
    input uwire id_7,
    input tri id_8,
    output wire id_9,
    input tri0 id_10,
    input wor id_11
);
  wire id_13;
  wire id_14;
  ;
endmodule
module module_1 #(
    parameter id_0  = 32'd11,
    parameter id_14 = 32'd68,
    parameter id_5  = 32'd67
) (
    input uwire _id_0,
    input uwire id_1,
    input wor id_2,
    output uwire id_3,
    output supply0 id_4,
    input tri _id_5,
    output tri id_6,
    input supply1 id_7,
    input wire id_8,
    input wire id_9,
    input tri1 id_10
);
  assign id_4 = 1 == id_2;
  wire [id_5  -  1 : 1 'b0] id_12, id_13, _id_14, id_15, id_16, id_17, id_18;
  integer id_19;
  id_20 :
  assert property (@(id_5 or -1) id_15) id_20 <= id_8 - -1;
  wire [id_14 : 1] id_21;
  wire [ 1 : id_0] id_22;
  parameter id_23 = 1;
  logic id_24;
  module_0 modCall_1 (
      id_3,
      id_10,
      id_7,
      id_8,
      id_1,
      id_8,
      id_6,
      id_1,
      id_1,
      id_3,
      id_9,
      id_7
  );
  assign modCall_1.id_1 = 0;
  always_ff @(-1) $clog2(84);
  ;
endmodule

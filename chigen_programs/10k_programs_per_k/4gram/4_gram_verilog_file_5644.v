// Seed: 3674726460
module module_0 #(
    parameter id_19 = 32'd20
) (
    input uwire id_0,
    output supply1 id_1,
    input tri0 id_2,
    input tri0 id_3,
    input supply1 id_4,
    input supply0 id_5 id_14,
    output supply1 id_6,
    output wor id_7,
    output wand id_8,
    input supply0 id_9,
    input tri1 id_10,
    output wor id_11,
    output tri0 id_12
);
  localparam id_15 = -1;
  wire id_16;
  ;
  wire [-1 'b0 : 1 'b0] id_17;
  wire id_18;
  wire _id_19;
  ;
  wire [id_19 : 1] id_20;
  wire [  -1 : -1] id_21;
endmodule
module module_1 #(
    parameter id_0 = 32'd27,
    parameter id_1 = 32'd60
) (
    input tri _id_0,
    input uwire _id_1,
    output wand id_2,
    input supply0 id_3,
    output tri id_4,
    input wire id_5,
    input tri0 id_6,
    output tri1 id_7,
    output tri id_8
);
  tri id_10 = id_10++;
  wire [id_1 : id_0] id_11;
  module_0 modCall_1 (
      id_3,
      id_8,
      id_5,
      id_3,
      id_5,
      id_3,
      id_7,
      id_8,
      id_7,
      id_6,
      id_6,
      id_8,
      id_7
  );
  assign modCall_1.id_12 = 0;
  logic id_12;
  ;
  assign id_10 = 1;
  nor primCall (id_7, id_10, id_11, id_3, id_6);
endmodule

// Seed: 3373921166
module module_0 (
    output supply0 id_0,
    input uwire id_1,
    input wand id_2,
    output tri0 id_3,
    input tri id_4,
    input wire id_5,
    output wand id_6,
    input tri0 id_7,
    output supply0 id_8,
    input tri1 id_9,
    input tri id_10,
    output wor id_11#(
        .id_15(1),
        .id_16(1),
        .id_17(1),
        .id_18(1),
        .id_19(-1)
    ),
    output tri1 id_12,
    input supply1 id_13
);
  assign module_1._id_7 = 0;
endmodule
module module_1 #(
    parameter id_0 = 32'd36,
    parameter id_2 = 32'd7,
    parameter id_7 = 32'd45
) (
    input tri1 _id_0,
    input supply0 id_1,
    input wor _id_2,
    output tri0 id_3,
    output supply1 id_4,
    input supply0 id_5,
    output tri id_6,
    input tri1 _id_7,
    input tri1 id_8,
    input supply1 id_9,
    output uwire id_10,
    input tri1 id_11
);
  logic [id_7 : id_0] id_13;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_8,
      id_10,
      id_9,
      id_5,
      id_6,
      id_11,
      id_10,
      id_9,
      id_8,
      id_4,
      id_3,
      id_1
  );
  assign id_13 = id_1;
  assign id_3  = 1;
  wire id_14;
  logic id_15 = 1;
  wire id_16;
  wire [1  ||  id_2 : {  1  ,  -1  }] id_17;
endmodule

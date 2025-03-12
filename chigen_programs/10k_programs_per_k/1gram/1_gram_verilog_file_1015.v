// Seed: 498205679
module module_0 #(
    parameter id_7 = 32'd18,
    parameter id_8 = 32'd53
) (
    output tri0 id_0,
    output uwire id_1,
    input supply1 id_2,
    input wand id_3[id_7 : id_8],
    input wand id_4,
    input wor id_5,
    input tri1 id_6,
    input tri1 _id_7,
    input wand _id_8,
    output tri0 id_9,
    input wand id_10,
    output wire id_11
);
  logic id_13 = id_4;
  assign id_9 = 1'b0;
  parameter id_14 = 1;
  assign module_1.id_0 = 0;
endmodule
module module_1 #(
    parameter id_1 = 32'd92,
    parameter id_8 = 32'd18,
    parameter id_9 = 32'd76
) (
    input uwire id_0,
    input supply0 _id_1,
    input wor id_2,
    input wire id_3,
    input supply0 id_4,
    output tri id_5,
    output wor id_6
);
  parameter id_8 = -1;
  logic [id_1 : 1] _id_9;
  wire [1  -  -1 : 1] id_10;
  assign id_10 = id_0;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_4,
      id_0,
      id_3,
      id_4,
      id_0,
      id_8,
      id_8,
      id_5,
      id_0,
      id_5
  );
  wire [id_8 : 1] id_11;
  assign id_5 = -1;
  wire [1 : id_9  ?  -1 : -1] id_12, id_13;
endmodule

// Seed: 1752197461
module module_0 #(
    parameter id_0 = 32'd50,
    parameter id_1 = 32'd57,
    parameter id_5 = 32'd97
) (
    input tri1  _id_0,
    input wire  _id_1,
    input uwire id_2,
    input wand  id_3
);
  wire [id_1  +  -1 : 1] _id_5, id_6;
  assign module_1.id_8 = 0;
  logic id_7;
  wire [id_5 : id_5] id_8;
  wire id_9;
  wire [id_0 : 1] id_10;
  always id_7 = -1;
endmodule
module module_1 #(
    parameter id_1 = 32'd19,
    parameter id_9 = 32'd89
) (
    input wire id_0,
    output tri0 _id_1,
    input wire id_2,
    input supply1 id_3,
    output supply0 id_4,
    input tri1 id_5[-1 : -1  +  -1],
    input tri id_6,
    input wand id_7,
    input tri0 id_8,
    inout wor _id_9,
    input supply0 id_10[-1 : id_1]
);
  parameter id_12[1 : id_9] = 1;
  nor primCall (id_9, id_7, id_2, id_8, id_10, id_0, id_12, id_3, id_6, id_5);
  assign id_9 = id_10;
  module_0 modCall_1 (
      id_9,
      id_9,
      id_10,
      id_7
  );
endmodule

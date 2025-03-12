// Seed: 1028412307
module module_0 (
    output tri0 id_0,
    input tri0 id_1,
    output uwire id_2,
    input wor id_3,
    input wire id_4,
    input supply1 id_5,
    input wand id_6,
    input wand id_7,
    input wire id_8
);
  parameter id_10 = -1;
  wire [(  -1  ) : 1] id_11;
  parameter id_12 = {id_10, -1};
endmodule
module module_1 #(
    parameter id_0 = 32'd72,
    parameter id_3 = 32'd26
) (
    input  wor  _id_0,
    input  tri  id_1,
    input  tri0 id_2,
    input  wor  _id_3,
    input  tri  id_4,
    output wire id_5
);
  uwire id_7 = -1;
  logic [7:0] id_8;
  ;
  assign id_8[id_0-id_3] = id_4;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_5,
      id_2,
      id_1,
      id_4,
      id_2,
      id_1,
      id_4
  );
  assign modCall_1.id_2 = 0;
endmodule

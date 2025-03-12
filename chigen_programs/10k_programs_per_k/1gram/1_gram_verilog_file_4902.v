// Seed: 3787166781
module module_0 (
    input  tri   id_0,
    output wand  id_1,
    output wire  id_2,
    output tri   id_3,
    input  wire  id_4,
    output uwire id_5,
    input  wor   id_6,
    input  wor   id_7
);
  assign id_5 = -1;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    input  tri1  id_0,
    output tri   id_1,
    output uwire id_2,
    input  wor   id_3,
    input  uwire id_4
);
  logic id_6 = id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_1,
      id_0,
      id_2,
      id_4,
      id_4
  );
  assign id_2 = -1'b0;
  logic id_7;
endmodule
module module_2 #(
    parameter id_0 = 32'd27,
    parameter id_3 = 32'd37,
    parameter id_4 = 32'd25,
    parameter id_6 = 32'd64
) (
    input wand _id_0,
    input wire id_1,
    output wor id_2,
    input tri _id_3,
    output tri _id_4
    , id_10,
    input supply1 id_5,
    input supply1 _id_6,
    output supply1 id_7[id_4 : 1],
    input wand id_8
);
  wire [1  +  id_6 : id_3  %  id_0] id_11, id_12;
  module_0 modCall_1 (
      id_8,
      id_7,
      id_2,
      id_7,
      id_1,
      id_2,
      id_5,
      id_5
  );
  assign modCall_1.id_3 = 0;
  assign id_7 = $realtime;
endmodule

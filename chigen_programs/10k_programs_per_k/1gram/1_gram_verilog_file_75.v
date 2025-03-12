// Seed: 3482124530
module module_0 (
    input  tri0  id_0,
    output uwire id_1,
    input  wand  id_2,
    input  tri1  id_3
);
  assign module_1.id_4 = 0;
endmodule
module module_1 #(
    parameter id_12 = 32'd22,
    parameter id_3  = 32'd58,
    parameter id_4  = 32'd69
) (
    input supply0 id_0,
    input wand id_1,
    output tri id_2,
    input tri1 _id_3,
    input wand _id_4,
    output wor id_5,
    input wire id_6,
    output wire id_7,
    output tri0 id_8,
    input supply1 id_9,
    output supply0 id_10,
    output supply1 id_11,
    input tri0 _id_12
);
  logic [7:0][id_3  &&  id_4] id_14[1 : -1];
  logic id_15;
  logic id_16;
  ;
  assign id_11 = -1'b0;
  logic [7:0][1] id_17;
  logic [7:0] id_18[1 : id_12];
  ;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_9,
      id_6
  );
  assign id_18[(-1)=={1&&-1'b0} : 1] = id_16;
  logic id_19;
  ;
  assign id_17 = id_17#(
      .id_16(1),
      .id_6 (1 == -1),
      .id_15(-1),
      .id_4 (-1)
  ) [-1 : id_12];
endmodule

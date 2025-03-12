// Seed: 2915039113
module module_0 (
    input  uwire id_0,
    output tri1  id_1,
    input  tri0  id_2,
    output tri1  id_3,
    input  wor   id_4,
    output tri   id_5,
    output tri1  id_6[  1 : 1],
    output tri0  id_7[-1 : -1],
    input  wand  id_8
);
  parameter id_10 = ({1, 1, 1 ^ 1, 1, 1, 1, 1, ""} ? 1 : 1);
  logic id_11;
endmodule
module module_1 #(
    parameter id_5 = 32'd40,
    parameter id_9 = 32'd26
) (
    input  uwire id_0,
    output uwire id_1,
    output wor   id_2,
    input  uwire id_3,
    output wor   id_4,
    input  uwire _id_5,
    input  tri   id_6 [1 'h0 : 1],
    input  wand  id_7
);
  logic _id_9;
  wire [1 : id_5] id_10[id_9 : 1];
  assign id_1 = -1;
  logic id_11 = -1;
  assign id_10 = id_9;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_1,
      id_3,
      id_1,
      id_4,
      id_1,
      id_0
  );
  assign modCall_1.id_4 = 0;
  task id_12;
    logic id_13, id_14;
    logic id_15 = id_0 + "";
  endtask
  assign id_12 = id_6;
endmodule

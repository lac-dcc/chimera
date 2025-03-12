// Seed: 1040647588
module module_0 #(
    parameter id_5 = 32'd2
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout tri1 id_4;
  input logic [7:0] id_3;
  input wire id_2;
  inout wire id_1;
  parameter id_5 = 1;
  assign id_4 = 1;
  assign id_4 = id_1;
  wire id_6;
  specify
    if (id_2) (id_7 => id_8) = (id_2);
    (id_9 => id_10) = (id_2  : 1 ? 1 : id_10  : id_6, 1  : id_10  : id_3[-1 : id_5]);
    $setup(posedge id_11, posedge id_12, id_11);
    (id_13 => id_14) = (id_12);
    (id_15 => id_16[{-1'b0, 1, id_1}]) = 1;
  endspecify
endmodule
module module_1 #(
    parameter id_4 = 32'd18
) (
    input  wire id_0,
    input  tri1 id_1,
    output wire id_2,
    input  wand id_3 [-1 'b0 : -1],
    input  tri1 _id_4
);
  logic id_6;
  ;
  wire [(  id_4  ) : 'h0] id_7;
  logic [7:0] id_8;
  module_0 modCall_1 (
      id_7,
      id_7,
      id_8,
      id_7
  );
  always @(id_0 or posedge -1'b0) id_8[-1'b0] = 1;
  always id_6 <= id_0;
endmodule

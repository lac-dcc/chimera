// Seed: 2273661926
module module_0 #(
    parameter id_3 = 32'd30
) (
    output uwire id_0,
    input  wand  id_1,
    output wire  id_2,
    input  tri0  _id_3,
    input  tri   id_4,
    output uwire id_5
);
  bit [1 : -1] id_7;
  wire id_8;
  assign id_7 = id_8 ? -1 : 1;
  wire [-1 : id_3  <  -1] id_9;
  always @(posedge id_9 <= -1'b0) begin : LABEL_0
    id_7 = id_9;
  end
endmodule
module module_1 #(
    parameter id_1 = 32'd4,
    parameter id_2 = 32'd17,
    parameter id_7 = 32'd53
) (
    input  uwire id_0,
    input  uwire _id_1,
    input  uwire _id_2,
    input  tri1  id_3,
    output wand  id_4
);
  logic id_6;
  logic [1 : id_2] _id_7;
  wire [id_1 : id_7] id_8;
  parameter id_9 = 1;
  assign id_7 = id_1;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_4,
      id_7,
      id_3,
      id_4
  );
  assign modCall_1.id_1 = 0;
endmodule

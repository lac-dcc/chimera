// Seed: 30511779
module module_0 #(
    parameter id_7 = 32'd54
) (
    input  wand  id_0,
    input  tri1  id_1,
    output tri0  id_2,
    input  wor   id_3,
    input  uwire id_4,
    input  wand  id_5
);
  wire _id_7;
  always_comb @(negedge -1) begin : LABEL_0
    $clog2(22);
    ;
  end
  wire id_8;
  always @(posedge 1) begin : LABEL_1
    $signed(40);
    ;
  end
  logic id_9[-1 : id_7  &  1];
endmodule
module module_1 #(
    parameter id_4 = 32'd11,
    parameter id_8 = 32'd40
) (
    input  uwire id_0,
    output tri0  id_1,
    output tri0  id_2,
    output uwire id_3,
    input  wor   _id_4
);
  wire [-1 : id_4] id_6;
  assign id_1 = 1'b0;
  genvar id_7;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_2,
      id_0,
      id_0,
      id_0
  );
  assign modCall_1.id_1 = 0;
  wire _id_8;
  wire id_9;
  assign id_7[id_8] = 1 < 1'h0;
endmodule

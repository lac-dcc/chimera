// Seed: 2643903239
module module_0 (
    output uwire id_0
    , id_6,
    input uwire id_1,
    input uwire id_2,
    input supply0 id_3,
    input tri id_4
);
  logic id_7;
  assign id_0 = 1;
  initial begin : LABEL_0
    `define pp_8 0
    disable id_9;
  end
  assign id_7 = id_2;
endmodule
module module_1 #(
    parameter id_2 = 32'd68,
    parameter id_3 = 32'd40,
    parameter id_6 = 32'd22
) (
    input  uwire id_0,
    output tri   id_1,
    input  wor   _id_2,
    input  wand  _id_3
);
  assign id_1 = -1;
  wire id_5;
  parameter id_6 = 1;
  wire [-1 : id_3] id_7;
  wire id_8 = ~id_0;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_0,
      id_0
  );
  assign modCall_1.id_3 = 0;
  wire id_9;
  logic [7:0][id_6 : id_2] id_10;
  assign id_10[-1] = 1;
endmodule

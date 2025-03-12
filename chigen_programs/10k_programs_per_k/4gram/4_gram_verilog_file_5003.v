// Seed: 962508187
module module_0 (
    input  uwire id_0,
    input  wire  id_1,
    output uwire id_2
);
  always_ff force id_2 = id_1;
  assign module_1.id_3 = 0;
  initial begin : LABEL_0
    assign id_2 = id_1;
  end
endmodule
module module_1 #(
    parameter id_2 = 32'd41,
    parameter id_5 = 32'd20
) (
    input  wand id_0,
    output wand id_1,
    input  wand _id_2,
    input  wand id_3,
    output tri  id_4,
    input  tri0 _id_5,
    input  wire id_6,
    input  wor  id_7
);
  logic [id_5 : -1  -  id_2] id_9;
  module_0 modCall_1 (
      id_0,
      id_7,
      id_4
  );
  timeunit 1ps;
  assign id_4 = 1;
  wire id_10;
endmodule

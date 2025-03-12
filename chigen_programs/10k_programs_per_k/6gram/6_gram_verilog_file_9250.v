// Seed: 1109131556
module module_0;
  logic [7:0] id_1;
  uwire id_2;
  assign id_1[1] = 1;
  wire id_3;
  assign id_2 = 1'b0 / {id_1#(.id_2(1)), id_2};
endmodule
module module_1 #(
    parameter id_5 = 32'd14
) (
    input  tri1  id_0,
    output tri1  id_1,
    output tri0  id_2,
    output logic id_3
);
  always id_3 = #1 id_0;
  wire _id_5;
  genvar id_6;
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
  bit [1 : (  id_5  )  -  -1] id_7;
  initial begin : LABEL_0
    id_7 <= id_6[-1];
  end
endmodule

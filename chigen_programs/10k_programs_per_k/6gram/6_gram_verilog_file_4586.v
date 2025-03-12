// Seed: 3098343705
module module_0;
  logic id_1;
  ;
  module_2 modCall_1 ();
  assign modCall_1.id_1 = 0;
  assign module_1.id_2  = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd12
) (
    id_1,
    _id_2,
    id_3
);
  output wire id_3;
  input wire _id_2;
  input wire id_1;
  genvar id_4;
  assign id_4 = !id_1;
  module_0 modCall_1 ();
  logic [7:0] id_5;
  assign id_5[id_2] = -1;
  logic id_6;
endmodule
module module_2 ();
  always disable id_1;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  module_2 modCall_1 ();
  assign modCall_1.id_1 = 0;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  always @(posedge id_4 or negedge -1) if (1 && -1) if (1) $unsigned(98);
  ;
endmodule

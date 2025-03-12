// Seed: 1957053889
module module_0 (
    id_1
);
  output wire id_1;
  module_2 modCall_1 ();
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  module_0 modCall_1 (id_3);
  input logic [7:0] id_2;
  inout wire id_1;
  initial begin : LABEL_0
    $signed(72);
    ;
  end
endmodule
module module_2;
  wire id_1;
endmodule
module module_3 #(
    parameter id_2 = 32'd74,
    parameter id_3 = 32'd35,
    parameter id_4 = 32'd33
) (
    id_1,
    _id_2,
    _id_3
);
  inout wire _id_3;
  inout wire _id_2;
  inout logic [7:0] id_1;
  assign id_1 = id_3;
  assign id_1[id_3 : id_2] = -1;
  module_2 modCall_1 ();
  logic _id_4 = id_1[id_4], id_5, id_6;
endmodule

// Seed: 1934720620
module module_0 (
    id_1
);
  output wire id_1;
  wire id_2;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout logic [7:0] id_2;
  inout wire id_1;
  module_0 modCall_1 (id_1);
  timeprecision 1ps;
endmodule
module module_2 #(
    parameter id_2 = 32'd8,
    parameter id_4 = 32'd2
) (
    id_1[id_2 : id_4],
    _id_2,
    id_3,
    _id_4
);
  input wire _id_4;
  module_0 modCall_1 (id_3);
  output wire id_3;
  inout wire _id_2;
  inout logic [7:0] id_1;
  bit [id_4  -  1 : id_2] \id_5 ;
  initial begin : LABEL_0
    if (1) \id_5 <= !"";
  end
  initial
    \id_5 #(
        .id_2(1),
        .id_4(1)
    ) = id_2;
endmodule

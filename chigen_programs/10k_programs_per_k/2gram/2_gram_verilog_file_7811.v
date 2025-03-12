// Seed: 3116008885
module module_0 (
    id_1
);
  output wire id_1;
  localparam id_2 = 1'b0;
endmodule
module module_1 #(
    parameter id_1 = 32'd86
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire _id_1;
  wire id_7;
  wire [1 : id_1] id_8;
  module_0 modCall_1 (id_2);
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout logic [7:0] id_2;
  output wire id_1;
  module_0 modCall_1 (id_3);
  assign id_1 = id_2[-1 :-1];
endmodule

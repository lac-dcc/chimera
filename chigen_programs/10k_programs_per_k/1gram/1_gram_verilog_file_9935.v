// Seed: 3082276719
module module_0 (
    id_1
);
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_2 = 32'd14
) (
    id_1,
    _id_2,
    id_3
);
  output wire id_3;
  inout wire _id_2;
  input wire id_1;
  wire [id_2 : -1] id_4, id_5;
  wire id_6;
  module_0 modCall_1 (id_5);
endmodule
module module_2 #(
    parameter id_5 = 32'd18,
    parameter id_6 = 32'd41
) (
    id_1[-1'h0 : 1],
    id_2,
    id_3,
    id_4,
    _id_5,
    _id_6[id_6 :-1],
    id_7,
    id_8
);
  output wire id_8;
  inout wire id_7;
  inout logic [7:0] _id_6;
  module_0 modCall_1 (id_4);
  inout wire _id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input logic [7:0] id_1;
  wire id_9, id_10[{  -1  {  id_5  }  } : 1];
  wire id_11, id_12, id_13;
endmodule

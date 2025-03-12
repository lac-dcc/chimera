// Seed: 3256970613
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_7;
endmodule
module module_1 #(
    parameter id_3 = 32'd17,
    parameter id_4 = 32'd9
) (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  parameter id_3 = 1;
  parameter id_4 = id_3;
  logic [7:0][-1 : {  id_4  ,  id_3  }] id_5;
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_6,
      id_6,
      id_6,
      id_6
  );
  assign id_5[1] = id_5 < id_6;
  assign id_5 = id_6;
endmodule

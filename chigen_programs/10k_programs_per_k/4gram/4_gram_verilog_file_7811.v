// Seed: 2786090659
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  wire id_3;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_3,
      id_2
  );
  parameter id_4 = 1;
endmodule
module module_2 #(
    parameter id_2 = 32'd62
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  input logic [7:0] id_10;
  inout wire id_9;
  output wor id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  module_0 modCall_1 (
      id_1,
      id_9
  );
  inout wire _id_2;
  inout wire id_1;
  assign id_8 = {id_10[-1-:~id_2] - 1, 1 - 1};
endmodule

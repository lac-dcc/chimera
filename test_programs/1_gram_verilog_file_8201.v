// Seed: 735345407
module module_0;
  wire id_2;
  import id_3::*;
  id_4(
      id_3, 1, 1
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  parameter id_5 = id_2;
  module_0 modCall_1 ();
  parameter id_6 = id_2;
  wire id_7;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_5 = id_6[1];
  module_0 modCall_1 ();
endmodule

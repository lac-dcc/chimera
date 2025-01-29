// Seed: 1110454974
module module_0 ();
  assign id_1 = 1;
  wire id_2;
  parameter id_3 = 1;
  wire id_4;
  wire id_5;
  module_2 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4
  );
  assign id_1 = id_3;
  wire id_6, id_7;
  parameter id_8 = -1'h0;
endmodule
module module_1 ();
  reg id_1;
  module_0 modCall_1 ();
  always id_2 <= id_1;
  assign id_1 = 1;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_5, id_6;
  assign module_0.id_1 = 0;
endmodule

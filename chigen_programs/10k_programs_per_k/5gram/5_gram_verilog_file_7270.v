// Seed: 2400422967
module module_0;
  wire id_2;
  wire id_3;
  assign module_1.id_1 = 0;
endmodule
module module_1;
  assign id_1 = 1;
  always @(id_1 or posedge 1 - 1) #1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_10;
  wire id_11;
  assign id_3 = id_1 ? 1 : id_2;
  module_0 modCall_1 ();
endmodule

// Seed: 3151890205
module module_0;
  assign id_1 = 1'b0;
  wire id_2, id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_6;
  integer id_7;
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_6;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  task id_7;
    id_1 <= 1;
  endtask
  localparam id_8 = id_4 == id_3;
endmodule

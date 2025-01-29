// Seed: 1849239469
module module_0;
  wire id_2;
  assign id_1 = -1;
  assign module_2.id_3 = 0;
  wire id_3, id_4;
  wire id_5, id_6;
  wire id_8;
  wire id_9;
  assign id_2 = id_9;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_4;
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  always_latch id_5 <= id_3;
  module_0 modCall_1 ();
  assign id_5 = -1;
  specify
    (id_6 => id_7) = (id_2 && 1, 1  : -1  : id_2);
  endspecify
endmodule

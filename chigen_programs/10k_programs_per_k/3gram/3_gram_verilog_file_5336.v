// Seed: 3122505935
module module_0 ();
  wire id_2;
  assign module_2.id_2 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always #1 id_2 = id_4;
  assign id_1 = 1;
  wire id_5;
  module_0 modCall_1 ();
  nor primCall (id_1, id_2, id_3, id_4, id_5);
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  module_0 modCall_1 ();
endmodule

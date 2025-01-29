// Seed: 139487103
module module_0;
  parameter time id_1 = 1;
  assign module_3.id_1 = 0;
  assign id_2 = id_1;
  assign module_2.id_3 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    input supply1 id_1,
    output logic id_2,
    output uwire id_3
);
  wire id_5;
  module_0 modCall_1 ();
  initial @(1) id_2 <= 1'b0;
  assign id_2 = 1;
endmodule
module module_2 (
    input  uwire id_0,
    input  wor   id_1,
    output uwire id_2,
    input  wire  id_3
);
  module_0 modCall_1 ();
  wire id_5 = id_5;
endmodule
module module_3;
  always id_1 <= !1;
  module_0 modCall_1 ();
endmodule

// Seed: 1687276205
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_6;
  wire id_7, id_8, id_9 = id_7;
  integer id_10;
  wire id_11;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  assign id_2 = id_3;
  reg id_4;
  xnor primCall (id_1, id_4, id_7, id_6, id_5);
  wire id_5;
  assign id_2 = 1;
  initial @(posedge 1 or posedge id_4) id_4 <= $display;
  wire id_6, id_7;
  assign id_4 = 0;
  module_0 modCall_1 (
      id_5,
      id_7,
      id_1,
      id_5,
      id_7
  );
endmodule

// Seed: 2619088035
module module_0 ();
  parameter id_1 = 1 * 1;
  for (id_2 = -1; -1; id_2 = -1) always id_2 = id_1[-1'b0];
  assign module_1.id_2 = 0.0;
endmodule
module module_1;
  union packed {
    id_1 id_2;
    logic id_3;
    struct packed {
      integer id_4;
      logic   id_5;
      logic   id_6;
    } id_7;
    realtime id_8;
  } id_9[-1 : -1  -  -1];
  logic id_10;
  assign id_9.id_8 = id_9.id_1[-1];
  module_0 modCall_1 ();
  tri id_11 = 1 == id_9.id_8;
endmodule

// Seed: 882539036
module module_0;
  initial assume (id_1);
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_7 = id_1;
  always
  fork
    id_8(id_5, 1);
    #1 id_4 = id_8;
    #1 id_1 = id_8;
  join
  wire id_9;
  wire id_10;
  module_0 modCall_1 ();
  tri id_11 = 1'b0 | 1'b0 / 1'b0;
endmodule

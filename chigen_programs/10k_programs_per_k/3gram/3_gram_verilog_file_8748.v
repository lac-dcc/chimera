// Seed: 2200115643
module module_0;
  wire id_2;
  assign module_2.id_2 = 0;
endmodule
module module_1 (
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
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_8;
  nor primCall (id_1, id_3, id_4, id_6, id_7, id_8);
  assign #1 id_8 = id_6;
  module_0 modCall_1 ();
  assign id_2 = 1'b0;
endmodule
module module_2 (
    input supply1 id_0,
    output tri id_1,
    input wire id_2
);
  wire id_4;
  module_0 modCall_1 ();
endmodule

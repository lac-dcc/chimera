// Seed: 3249513853
module module_0 ();
  uwire id_2, id_3, id_4;
  tri1 id_5;
  assign id_3 = id_5;
  assign module_3.type_17 = 0;
  wire id_6;
  assign id_5 = -1;
  parameter id_7 = 1;
endmodule
module module_1 ();
  wire id_1, id_2, id_3;
  module_0 modCall_1 ();
  assign modCall_1.type_1 = 0;
  wire id_4;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_3 = 1;
  module_0 modCall_1 ();
endmodule
macromodule module_3 (
    input wire id_0,
    output tri1 id_1,
    input tri0 id_2,
    input uwire id_3,
    input tri id_4,
    output supply1 id_5,
    output logic id_6,
    input supply1 id_7,
    input uwire id_8,
    output tri1 id_9,
    input supply0 id_10,
    input wire id_11,
    output wor id_12,
    output tri0 id_13,
    output wand id_14,
    input supply0 id_15
);
  initial wait (id_11 !== 1) @(posedge 1 or posedge id_11) id_6 <= 1;
  module_0 modCall_1 ();
endmodule

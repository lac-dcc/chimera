// Seed: 119541925
module module_0;
  wire id_1;
  assign module_2.type_1 = 0;
  assign module_1.id_1   = 0;
endmodule
module module_1;
  uwire id_1 = 1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    output tri0 id_0,
    input  wire id_1,
    output wand id_2,
    output wand id_3,
    output tri1 id_4
);
  wire id_6;
  nor primCall (id_0, id_1, id_6, id_7);
  wire id_7;
  module_0 modCall_1 ();
endmodule
module module_3 (
    output tri id_0,
    input tri1 id_1,
    output supply1 id_2,
    input wire id_3,
    input uwire id_4,
    input wire id_5,
    inout tri0 id_6,
    input tri0 id_7,
    output wire id_8
);
  wire id_10;
  module_0 modCall_1 ();
  assign id_0 = id_3 ? id_6 : 1;
endmodule

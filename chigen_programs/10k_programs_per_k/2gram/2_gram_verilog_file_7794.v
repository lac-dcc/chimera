// Seed: 248044115
module module_0 (
    input uwire id_0
);
  wire id_2;
  wire id_3;
  assign module_2.id_2 = 0;
  wire id_4;
endmodule
module module_1 (
    output supply0 id_0,
    input uwire id_1,
    input wand id_2,
    output tri id_3,
    input tri id_4,
    output wor id_5
);
  module_0 modCall_1 (id_2);
  assign modCall_1.type_0 = 0;
endmodule
module module_2 (
    input logic id_0,
    output logic id_1,
    input supply1 id_2,
    output wor id_3
);
  assign id_1 = id_0;
  module_0 modCall_1 (id_2);
  always id_1 <= #id_2 id_0;
  wire id_5;
  not primCall (id_3, id_0);
endmodule

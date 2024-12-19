// Seed: 2559428090
module module_0 (
    input  tri0 id_0,
    output tri1 id_1
);
  always if (1 == 1) #1 assign id_1 = 1 + {(1'b0 - id_0) {1'b0}};
  module_2 modCall_1 (id_0);
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input  wor  id_0,
    output wire id_1,
    input  wor  id_2,
    output wand id_3
);
  wire id_5;
  assign id_3 = id_2;
  module_0 modCall_1 (
      id_0,
      id_3
  );
  wire id_6, id_7;
  xor primCall (id_3, id_2, id_0, id_5);
endmodule
module module_2 (
    input tri1 id_0
);
  string id_2;
  assign id_2 = "";
  assign module_0.id_0 = 0;
  wire id_3;
endmodule

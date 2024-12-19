// Seed: 3668894744
module module_0 (
    output wand id_0,
    output supply1 id_1
);
  always #1;
  assign id_1 = 1;
  timeunit 1ps;
  module_2 modCall_1 ();
  assign modCall_1.type_3 = 0;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input  uwire id_1
);
  assign id_0 = id_1;
  wire id_3;
  wire id_4;
  assign id_4 = 1;
  wand id_5;
  assign id_0 = 1;
  module_0 modCall_1 (
      id_4,
      id_4
  );
  supply1 id_6 = 1;
  assign id_0 = id_4;
  wire id_7;
  assign id_5 = 1'b0;
  xnor primCall (id_0, id_5, id_1);
endmodule
module module_2;
  assign id_1 = id_1 - 1'b0;
  wire id_2 = 1'b0;
endmodule

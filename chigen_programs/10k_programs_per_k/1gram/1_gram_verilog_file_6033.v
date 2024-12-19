// Seed: 472432940
module module_0 ();
  wire id_2;
  assign id_1 = 1;
  wire id_3 = id_2;
  assign id_1 = 1;
  assign module_2.type_12 = 0;
endmodule
macromodule module_1 (
    input wand id_0,
    output uwire id_1,
    input wand id_2,
    input wire void id_3,
    input tri id_4
);
  uwire id_6;
  module_0 modCall_1 ();
  logic [7:0] id_7;
  wire id_8;
  initial id_7[1] <= 1;
  wire id_9;
  id_10(
      id_6, 1, 1, 1
  );
endmodule
module module_2 (
    input wand id_0,
    output wand id_1,
    input supply1 id_2,
    output tri id_3,
    output uwire id_4,
    input tri id_5,
    output tri id_6,
    input supply0 id_7
);
  initial if (id_0) if (id_2) id_3 = 1'b0 - id_7;
  assign #1 id_4 = id_2;
  module_0 modCall_1 ();
  initial $display(1, id_5, id_7);
  assign id_3 = id_7 - id_5;
  wire id_9;
endmodule

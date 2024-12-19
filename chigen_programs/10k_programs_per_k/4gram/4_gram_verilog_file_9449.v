// Seed: 2055904371
module module_0 (
    input  wor   id_0,
    output uwire id_1,
    input  tri0  id_2
);
  initial begin : LABEL_0
    wait (id_2);
  end
  wire id_4, id_5;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    output wor id_1,
    output wand id_2,
    input uwire id_3,
    output tri id_4,
    output wand id_5,
    input tri id_6,
    input wand id_7
);
  wire id_9;
  wire id_10;
  wire id_11;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_6
  );
endmodule
module module_2 ();
  supply1 id_1;
  tri0 id_2;
  assign id_2 = id_1;
  initial assume (1);
  wire id_3;
  assign id_3 = id_2;
  wand id_4;
  always_comb @(posedge id_4) id_5();
  assign id_1 = id_4;
  assign id_5 = 1;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign {id_3, 1 - 1, id_3, id_1, 1, 1} = 1;
  module_2 modCall_1 ();
  assign modCall_1.id_5 = 0;
endmodule

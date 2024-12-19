// Seed: 1625472215
module module_0 (
    input  wand  id_0,
    output tri0  id_1,
    input  uwire id_2,
    input  tri   id_3,
    input  tri0  id_4
);
  assign id_1 = ~id_2;
  module_2 modCall_1 ();
  assign module_1.type_11 = 0;
endmodule
module module_1 (
    output tri   id_0,
    input  tri0  id_1,
    output tri1  id_2,
    input  tri   id_3,
    input  uwire id_4,
    input  uwire id_5,
    output wire  id_6
);
  module_0 modCall_1 (
      id_3,
      id_2,
      id_5,
      id_3,
      id_5
  );
  wire id_8;
  wire id_9, id_10;
endmodule
module module_2 ();
  always id_1 <= id_1;
  reg id_2 = id_2;
  assign id_2 = id_1;
  assign id_1 = id_1;
  wire id_3;
  wire id_4;
  uwire id_5, id_6;
  assign id_2 = id_6 == id_5;
  if (1) id_7(.id_0(1'h0));
  assign id_3 = (!id_6);
  assign module_0.id_2 = 0;
  wire  id_8;
  wire  id_9;
  uwire id_10, id_11 = 1;
  wire  id_12;
  wire  id_13;
endmodule

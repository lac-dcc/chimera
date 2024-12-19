// Seed: 674326604
module module_0 (
    input  wand  id_0,
    input  uwire id_1,
    input  tri1  id_2,
    output wor   id_3
);
  assign id_3 = id_1;
  wire id_5;
  assign module_1.id_7 = 0;
  wire id_6;
  reg  id_7;
  reg  id_8;
  final begin : LABEL_0
    id_8 <= {1, (id_7)};
  end
  wire id_9;
  wire id_10;
endmodule
module module_1 (
    input uwire id_0,
    input uwire id_1,
    input wire id_2,
    input wor id_3,
    input wand id_4,
    input supply0 id_5,
    input tri1 id_6,
    output tri0 id_7,
    output uwire id_8,
    input supply1 id_9
);
  assign id_7 = id_2;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_5,
      id_7
  );
  wire id_11;
endmodule

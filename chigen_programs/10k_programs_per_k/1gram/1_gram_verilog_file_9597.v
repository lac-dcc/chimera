// Seed: 1059894953
module module_0 (
    output uwire id_0
);
  assign module_2.id_0 = 0;
  assign id_0 = -1;
endmodule
module module_1 (
    output wor  id_0,
    input  tri0 id_1
);
  assign id_0 = 1 === id_1;
  module_0 modCall_1 (id_0);
  assign modCall_1.id_0 = 0;
endmodule
module module_2 (
    output wor   id_0,
    input  wand  id_1,
    output tri   id_2,
    input  uwire id_3,
    output tri0  id_4,
    input  tri0  id_5
);
  module_0 modCall_1 (id_2);
endmodule
program module_3 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wor id_2;
  inout wire id_1;
  assign (weak1, highz0) id_2 = 1;
endprogram
module module_4 #(
    parameter id_8 = 32'd88,
    parameter id_9 = 32'd8
) (
    input uwire id_0,
    input tri1 id_1,
    output logic id_2,
    input wand id_3,
    input wand id_4,
    input tri1 id_5,
    input uwire id_6,
    input tri id_7,
    input supply0 _id_8,
    output wor _id_9,
    input tri1 id_10
);
  logic id_12;
  parameter id_13[id_9 : id_8] = 1;
  assign id_12 = id_5;
  always begin : LABEL_0
    if (1);
    else id_2 = -1;
  end
  wire id_14;
  module_3 modCall_1 (
      id_13,
      id_14,
      id_13
  );
  assign id_14 = 1;
endmodule

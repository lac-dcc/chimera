// Seed: 2053070707
module module_0 (
    input  tri1 id_0,
    inout  tri1 id_1,
    output wand id_2,
    input  tri  id_3,
    input  wire id_4,
    output wor  id_5,
    input  tri  id_6
);
  wire id_8;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    inout wor  id_1,
    input wand id_2,
    input tri1 id_3,
    input wand id_4
);
  assign id_1 = -1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_3,
      id_3,
      id_1,
      id_0
  );
endmodule
module module_2 (
    input uwire id_0,
    input wand id_1,
    input uwire id_2,
    output supply1 id_3,
    input tri0 id_4,
    input wand id_5,
    output uwire id_6,
    output wire id_7
);
  assign id_6 = id_0;
  assign module_3.id_5 = 0;
  parameter id_9 = 1;
  tri id_10, id_11;
  assign id_11 = 1;
endmodule
module module_3 (
    input  tri   id_0,
    output tri1  id_1,
    input  wand  id_2,
    output logic id_3,
    input  wand  id_4,
    output uwire id_5
);
  for (id_7 = -1; -1; id_3 = id_4 & id_2) begin : LABEL_0
    assign id_3 = id_7;
  end
  module_2 modCall_1 (
      id_0,
      id_2,
      id_4,
      id_1,
      id_2,
      id_0,
      id_1,
      id_1
  );
  assign id_3 = id_5++;
endmodule

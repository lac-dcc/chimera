// Seed: 1035737786
module module_0 (
    input tri0 id_0,
    input wor id_1,
    input wand id_2,
    input wire id_3,
    output logic id_4,
    input supply0 id_5,
    input tri id_6,
    input tri1 id_7,
    input tri0 id_8
);
  always id_4 <= #1 -1;
endmodule
module module_1 (
    input tri0 id_0,
    output logic id_1,
    output wor id_2,
    input tri0 id_3,
    input wand id_4,
    input supply0 id_5,
    input wor id_6,
    output uwire id_7
);
  wire  id_9;
  logic id_10;
  initial begin : LABEL_0
    if (1) id_1 <= -1 == 1;
  end
  xnor primCall (id_1, id_0, id_5, id_9, id_4, id_6, id_3);
  module_0 modCall_1 (
      id_6,
      id_5,
      id_4,
      id_6,
      id_1,
      id_5,
      id_6,
      id_4,
      id_0
  );
  assign modCall_1.id_6 = 0;
endmodule

// Seed: 2015490243
module module_0 (
    output wire id_0,
    input tri1 id_1,
    input tri1 id_2,
    input uwire id_3,
    output wor id_4,
    output wire id_5,
    input wand id_6,
    output uwire module_0,
    input tri1 id_8,
    input tri id_9,
    output tri0 id_10,
    input supply0 id_11
);
  assign id_4 = id_1;
  assign module_1.id_2 = 0;
endmodule
module module_1 #(
    parameter id_5 = 32'd94
) (
    input tri0 id_0,
    output supply0 id_1,
    input tri1 id_2,
    input supply1 id_3
);
  parameter id_5 = -1;
  logic [7:0] id_6;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_2,
      id_3,
      id_1,
      id_1,
      id_3,
      id_1,
      id_2,
      id_3,
      id_1,
      id_0
  );
  initial begin : LABEL_0
    id_6[id_5] = 1;
  end
  assign id_1 = id_0 == -1;
endmodule

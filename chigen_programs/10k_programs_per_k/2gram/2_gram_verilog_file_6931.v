// Seed: 1210106214
module module_0 (
    input tri id_0,
    input supply1 id_1,
    input supply0 id_2,
    input wire id_3,
    input tri1 id_4,
    output uwire id_5,
    output wand id_6,
    output supply0 id_7,
    input tri0 id_8,
    output tri1 id_9,
    output supply1 id_10,
    output wire id_11,
    input wand id_12
);
  assign id_7 = id_12;
  assign id_9 = 1;
  assign module_1.id_3 = 0;
  if (1) begin : LABEL_0
    wire id_14;
  end else begin : LABEL_1
    assign id_5 = id_8;
  end
endmodule
module module_1 (
    input  tri0  id_0,
    input  wor   id_1,
    output logic id_2,
    input  tri   id_3,
    output tri1  id_4,
    input  tri1  id_5
);
  always id_2 <= -1;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_0,
      id_1,
      id_0,
      id_4,
      id_4,
      id_4,
      id_3,
      id_4,
      id_4,
      id_4,
      id_1
  );
endmodule

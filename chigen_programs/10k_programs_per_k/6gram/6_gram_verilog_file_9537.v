// Seed: 1729360418
module module_0 (
    input  tri1  id_0,
    input  tri0  id_1,
    output wand  id_2,
    output tri0  id_3,
    input  wire  id_4,
    output wand  id_5,
    output logic id_6
);
  always @(posedge id_1 or posedge 1'b0) id_6 = id_1 & 1;
  assign module_1.id_4 = 0;
  always @(*) id_6 = id_1;
endmodule
module module_1 (
    input supply1 id_0,
    output logic id_1,
    output wor id_2,
    output wand id_3,
    input wor id_4,
    input wor id_5,
    output uwire id_6,
    output supply1 id_7,
    input supply1 id_8,
    input tri0 id_9,
    input wor id_10,
    input tri0 id_11,
    input wire id_12
);
  always @(1 or 1) if ((1 && !1)) id_1 <= id_10 ~^ -1;
  xnor primCall (id_7, id_9, id_10, id_4, id_8, id_0, id_11, id_12, id_5);
  module_0 modCall_1 (
      id_11,
      id_5,
      id_6,
      id_3,
      id_11,
      id_7,
      id_1
  );
endmodule

// Seed: 4010183540
module module_0 (
    input tri id_0,
    output tri0 id_1,
    input supply0 id_2,
    input tri0 id_3,
    input wor id_4,
    output wor id_5,
    input supply0 id_6,
    input wand id_7,
    input supply0 id_8,
    output supply1 id_9,
    output supply0 id_10,
    input supply0 id_11,
    input wand id_12,
    input uwire id_13,
    input supply0 id_14,
    output tri id_15
);
  wire id_17;
  assign module_1.id_12 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    input tri1 id_1,
    input uwire id_2,
    input supply1 id_3,
    output tri1 id_4,
    input supply1 id_5,
    input tri1 id_6,
    input wor id_7,
    input logic id_8,
    input tri id_9,
    input supply0 id_10,
    output tri0 id_11,
    output logic id_12
);
  always @(posedge 1 or posedge id_6) id_12 = #1 id_8;
  xnor primCall (id_12, id_7, id_10, id_1, id_5, id_2, id_9, id_8, id_3, id_6);
  module_0 modCall_1 (
      id_7,
      id_11,
      id_1,
      id_5,
      id_2,
      id_4,
      id_7,
      id_10,
      id_10,
      id_11,
      id_11,
      id_10,
      id_6,
      id_5,
      id_5,
      id_0
  );
endmodule

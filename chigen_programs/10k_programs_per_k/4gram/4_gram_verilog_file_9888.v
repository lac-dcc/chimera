// Seed: 4253782985
module module_0 (
    input uwire id_0,
    input supply1 id_1,
    input supply0 id_2,
    output tri1 id_3,
    output wire id_4,
    input tri0 id_5,
    output tri id_6,
    output uwire id_7
);
  logic id_9;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output logic id_0
    , id_10,
    input wor id_1,
    input tri1 id_2,
    output uwire id_3,
    output wor id_4,
    output supply0 id_5,
    output wand id_6,
    input tri0 id_7,
    output wor id_8
);
  module_0 modCall_1 (
      id_1,
      id_7,
      id_1,
      id_8,
      id_4,
      id_7,
      id_6,
      id_4
  );
  assign id_8 = 1'b0;
  assign id_6 = id_2;
  always @(id_2 or posedge id_2 && -1) id_0 = id_2;
endmodule

// Seed: 1876451093
module module_0 (
    output tri0  id_0,
    output uwire id_1,
    input  wire  id_2,
    output tri1  id_3,
    output uwire id_4,
    input  tri1  id_5
);
  wire [-1 : ""] id_7;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input tri id_0,
    input wire id_1,
    input supply1 id_2
    , id_8,
    output wand id_3,
    input tri0 id_4,
    output wor id_5,
    output logic id_6
);
  wire id_9;
  parameter id_10 = 1;
  always @(id_1 or posedge id_2) id_6 <= -1;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_4,
      id_5,
      id_5,
      id_0
  );
  assign id_5 = 1'd0;
  localparam id_11 = 1;
  or primCall (id_5, id_0, id_8, id_2, id_9, id_1, id_10, id_4);
  assign id_3 = id_2 - id_1;
  assign id_6 = id_4;
endmodule

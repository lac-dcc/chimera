// Seed: 3362252792
module module_0 (
    input wand id_0,
    output supply1 id_1,
    input wire id_2,
    output wor id_3,
    input wor id_4,
    input tri id_5,
    input supply0 id_6,
    input tri0 id_7
);
  localparam id_9 = 1;
  assign id_3 = id_0;
  assign module_1.id_1 = 0;
  `define pp_10 0
  reg id_11;
  generate
    always @(posedge id_11 or posedge id_7) id_11 = -1;
    logic id_12;
  endgenerate
endmodule
module module_1 (
    output tri   id_0,
    input  wand  id_1,
    output logic id_2
);
  always id_2 <= id_1;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1
  );
endmodule

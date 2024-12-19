// Seed: 1138049721
module module_0 (
    output tri1 id_0,
    input tri id_1,
    output wor id_2,
    input tri id_3,
    input supply1 id_4,
    input supply0 id_5,
    input supply1 id_6,
    output wand id_7
);
  wire id_9;
  wand id_10;
  assign module_1.id_3 = 0;
  assign id_10 = 1;
  wire id_11;
endmodule
module module_1 (
    input wire id_0,
    output tri1 id_1,
    input supply1 id_2,
    output logic id_3,
    input tri1 id_4,
    input tri id_5,
    input wand id_6,
    input wire id_7
);
  assign id_3 = 1;
  wire id_9;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_1,
      id_0,
      id_5,
      id_5,
      id_6,
      id_1
  );
  always @(negedge id_6 - 1'd0) id_3 = #1 1'b0;
endmodule

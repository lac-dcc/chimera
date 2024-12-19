// Seed: 2538758593
module module_0 (
    input tri1 id_0,
    input wor id_1,
    input supply0 id_2,
    input tri0 id_3,
    input wand id_4,
    output wire id_5
);
  always @(1 or posedge id_4 - 1) while (1'b0) id_5 = ~id_4 | id_0;
endmodule
module module_1 (
    input tri1 id_0,
    output uwire id_1,
    output supply0 id_2,
    input wire id_3,
    output wor id_4
);
  always @(1) id_2 = id_0;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1
  );
  assign modCall_1.id_4 = 0;
endmodule

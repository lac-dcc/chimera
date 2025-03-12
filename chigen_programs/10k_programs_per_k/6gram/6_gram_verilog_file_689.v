// Seed: 1229816081
module module_0 (
    output uwire id_0,
    input  wand  id_1,
    output uwire id_2,
    input  wand  id_3,
    output tri1  id_4
);
endmodule
module module_1 (
    output supply1 id_0,
    input uwire id_1,
    input supply1 id_2,
    input wire id_3,
    input supply0 id_4,
    output supply0 id_5,
    output logic id_6,
    input wire id_7,
    output wand id_8,
    input tri1 id_9,
    output uwire id_10,
    input wire id_11
);
  wire id_13;
  wire id_14;
  module_0 modCall_1 (
      id_8,
      id_4,
      id_5,
      id_9,
      id_5
  );
  assign modCall_1.id_0 = 0;
  always @(posedge id_9) id_6 = #1 1;
endmodule

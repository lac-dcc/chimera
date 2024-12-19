// Seed: 1986299188
module module_0 (
    input wire id_0,
    output wor id_1,
    input tri0 id_2,
    output tri1 id_3,
    input wor id_4,
    input wire id_5,
    output tri0 id_6,
    input wire id_7,
    input tri1 id_8,
    output supply0 id_9
);
  assign id_1 = 1;
  wand id_11;
  wire id_12;
  tri0 id_13;
  assign id_3 = 1'b0;
  always disable id_14#(1, id_11);
  wand id_15 = id_2;
  always repeat (1) id_13 = id_11;
endmodule
module module_1 (
    output tri1 id_0,
    output tri0 id_1,
    input  tri0 id_2,
    input  tri0 id_3
);
  assign id_0 = id_2;
  assign #1 id_0 = id_3;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_3,
      id_1,
      id_2,
      id_3,
      id_1,
      id_3,
      id_2,
      id_0
  );
  assign modCall_1.id_11 = 0;
endmodule

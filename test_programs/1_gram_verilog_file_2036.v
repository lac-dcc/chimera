// Seed: 2011570227
module module_0 (
    input supply0 id_0,
    input wand id_1,
    input wand id_2,
    input tri1 id_3,
    output wire id_4,
    output wor id_5,
    output wire id_6,
    output tri0 id_7
);
  wire id_9;
  assign id_5 = id_2;
  assign id_6 = 1;
endmodule
module module_1 (
    output tri0 id_0,
    input supply1 id_1,
    input tri0 id_2,
    input tri0 id_3,
    input tri1 id_4,
    input tri0 id_5,
    output uwire id_6,
    input tri0 id_7,
    output logic id_8,
    input logic id_9,
    input wand id_10
);
  id_12(
      .id_0(1'b0), .id_1()
  ); timeunit 1ps;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_4,
      id_5,
      id_6,
      id_6,
      id_0,
      id_0
  );
  assign modCall_1.id_4 = 0;
  always_ff id_8 <= id_9;
endmodule

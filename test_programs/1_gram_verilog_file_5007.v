// Seed: 2313895672
module module_0 (
    output logic id_0,
    input supply0 id_1,
    output wor id_2,
    output tri1 id_3,
    input logic id_4,
    input uwire id_5,
    output wor id_6,
    input wand id_7,
    output tri0 id_8,
    input logic id_9,
    input wor id_10,
    input tri0 id_11,
    output uwire id_12
);
  assign id_2 = id_11;
  reg id_14;
  initial id_0 <= id_9 ? id_14 : 1;
  assign id_6 = id_10;
  assign module_1.id_1 = 0;
  final {id_9, id_4, 1'b0} <= 1;
  assign id_3 = 1;
  wire id_15;
endmodule
module module_1 (
    output supply1 id_0,
    input tri1 id_1,
    input wor id_2,
    output logic id_3,
    input wand id_4,
    output tri1 id_5,
    inout logic id_6
);
  always id_3 <= id_6;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_5,
      id_0,
      id_6,
      id_2,
      id_5,
      id_1,
      id_0,
      id_6,
      id_2,
      id_2,
      id_0
  );
endmodule

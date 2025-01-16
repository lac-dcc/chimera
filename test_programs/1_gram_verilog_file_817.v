// Seed: 693136724
module module_0 (
    input uwire id_0,
    output tri id_1,
    input tri0 id_2,
    output wor id_3,
    input supply1 id_4,
    input tri id_5,
    output supply1 id_6,
    input supply0 id_7,
    input wand id_8,
    input tri0 id_9,
    input wand id_10,
    output wire id_11,
    output wor id_12,
    inout tri0 id_13
);
  assign id_1 = -1;
endmodule
module module_1 (
    input wor id_0,
    output supply1 id_1,
    output logic id_2,
    input logic id_3
);
  always begin : LABEL_0
    if (1) id_2 <= id_3;
  end
  supply0 id_5, id_6, id_7, id_8;
  parameter id_9 = id_5;
  id_10(
      1'h0, id_0, 1
  );
  assign id_1 = id_9;
  module_0 modCall_1 (
      id_0,
      id_9,
      id_0,
      id_9,
      id_9,
      id_0,
      id_1,
      id_9,
      id_0,
      id_9,
      id_0,
      id_9,
      id_9,
      id_9
  );
  assign modCall_1.id_6 = 0;
endmodule

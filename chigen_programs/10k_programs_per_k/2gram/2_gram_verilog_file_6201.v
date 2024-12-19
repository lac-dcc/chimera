// Seed: 3212508371
module module_0 (
    input wand id_0,
    output uwire id_1,
    output supply1 id_2,
    output tri1 id_3,
    input supply0 id_4,
    input uwire id_5,
    input tri1 id_6,
    input uwire id_7,
    output tri id_8,
    input wand id_9,
    output supply1 id_10,
    output wand id_11
);
  assign id_1 = id_7;
  wire id_13 = (id_6);
  assign module_1.type_4 = 0;
  uwire id_14, id_15 = id_5;
  assign id_2 = id_0;
endmodule
module module_1 (
    input wor id_0,
    input wor id_1,
    input uwire id_2,
    input logic id_3,
    input uwire id_4,
    input uwire id_5,
    input uwire id_6,
    output logic id_7,
    output uwire id_8,
    output tri id_9,
    input wand id_10,
    input wire id_11,
    output wor id_12,
    input supply0 id_13
);
  assign id_8 = 1 != 1;
  wire id_15;
  always begin : LABEL_0
    id_7 <= id_3;
  end
  module_0 modCall_1 (
      id_0,
      id_9,
      id_12,
      id_12,
      id_4,
      id_4,
      id_0,
      id_4,
      id_9,
      id_5,
      id_9,
      id_12
  );
endmodule

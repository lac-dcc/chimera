// Seed: 1031520392
module module_0 (
    input uwire id_0,
    input tri id_1,
    input supply1 id_2,
    output tri0 id_3,
    output supply0 id_4,
    input wand id_5
);
  wire id_7;
  assign module_2.id_1 = 0;
endmodule
module module_1 (
    input uwire id_0,
    id_8,
    inout supply1 id_1,
    input wor id_2,
    output wire id_3,
    input uwire id_4,
    output supply0 id_5,
    output wire id_6
);
  assign id_1 = id_4 - 1;
  wire id_9, id_10;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_4,
      id_1,
      id_5,
      id_0
  );
  assign modCall_1.type_8 = 0;
endmodule
module module_2 (
    input uwire id_0,
    input supply0 id_1,
    output tri0 id_2,
    input tri id_3,
    output wand id_4,
    output tri id_5,
    output wire id_6,
    input tri0 id_7,
    input uwire id_8,
    output tri1 id_9,
    output wand id_10,
    output wire id_11,
    input supply0 id_12,
    output logic id_13
);
  assign id_9 = id_8 & -1;
  assign id_5 = 1;
  module_0 modCall_1 (
      id_8,
      id_12,
      id_12,
      id_9,
      id_5,
      id_8
  );
  wire id_15;
  always id_13 <= 1'b0;
  xnor primCall (id_9, id_8, id_0, id_7, id_12, id_3, id_1);
endmodule

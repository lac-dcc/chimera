// Seed: 3555495750
module module_0 (
    input tri id_0,
    input wand id_1,
    input wire id_2,
    input uwire id_3,
    input uwire id_4,
    input wor id_5,
    input wor id_6,
    output uwire id_7,
    input uwire id_8,
    output uwire id_9,
    output supply0 id_10,
    output tri id_11,
    output wor id_12
);
  assign id_9 = id_1;
  real id_14;
  assign module_1.type_2 = 0;
  supply0 id_15 = 1;
  assign id_10 = id_15;
  assign id_12 = id_1;
  wire id_16, id_17, id_18;
endmodule
module module_1 (
    input tri id_0,
    input supply1 id_1,
    input supply0 id_2,
    input supply1 id_3,
    input wor id_4,
    input tri id_5
);
  assign id_7 = id_0;
  uwire id_8;
  final begin : LABEL_0
    id_7 = id_8;
  end
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_0,
      id_7,
      id_4,
      id_5,
      id_7,
      id_3,
      id_7,
      id_7,
      id_8,
      id_7
  );
endmodule

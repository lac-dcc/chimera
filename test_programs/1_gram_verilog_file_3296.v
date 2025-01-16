// Seed: 3564994590
module module_0 (
    output tri id_0,
    output wire id_1,
    output uwire id_2,
    output wor id_3,
    output wand id_4,
    input tri0 id_5,
    input wand id_6,
    input tri1 id_7,
    input wand id_8,
    output tri0 id_9,
    input tri0 id_10,
    output supply0 id_11,
    input tri1 id_12,
    id_17,
    input wor id_13,
    input tri id_14,
    input uwire id_15
);
  assign id_11 = id_5 | id_10;
  id_18(
      .id_0(1), .id_1(-1), .id_2(id_1), .id_3(id_3)
  );
  wire id_19;
  wire \id_20 ;
  assign module_1.type_3 = 0;
  initial id_0 = -1;
  always id_0 = -1;
  wire id_21, id_22, id_23, id_24, id_25, id_26, id_27 = id_19;
endmodule
module module_1 (
    input tri0  id_0,
    input uwire id_1
);
  tri id_3;
  wor id_4;
  assign id_3 = id_4;
  assign id_3 = id_0;
  localparam id_5 = 1;
  assign id_3 = id_0;
  wire id_6;
  wire id_7;
  assign id_4 = id_3;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_4,
      id_3,
      id_4,
      id_0,
      id_1,
      id_1,
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_0,
      id_1,
      id_1
  );
  wire id_8;
  id_9(
      .id_0($display)
  );
endmodule

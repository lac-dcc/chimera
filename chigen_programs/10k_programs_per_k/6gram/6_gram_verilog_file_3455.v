// Seed: 1542703564
module module_0 (
    output wor id_0,
    output supply1 id_1,
    output uwire id_2,
    input tri0 id_3,
    input uwire id_4,
    input wor id_5,
    input uwire id_6,
    input wire id_7,
    output tri id_8
);
endmodule
module module_1 (
    input wor id_0,
    input wor id_1,
    input tri0 id_2,
    input wor id_3,
    input supply1 id_4,
    input supply1 id_5,
    input tri id_6,
    output supply1 id_7
);
  uwire id_9;
  wire  id_10;
  assign id_9 = 1'd0;
  integer id_11;
  wor id_12;
  assign id_12 = 1 == 1;
  tri1 id_13;
  wire id_14;
  wire id_15;
  assign id_9 = 'b0;
  wire id_16 = id_11[1];
  assign id_13 = id_3 == 1;
  module_0 modCall_1 (
      id_7,
      id_7,
      id_7,
      id_4,
      id_1,
      id_2,
      id_4,
      id_3,
      id_7
  );
  assign modCall_1.id_0 = 0;
  always #0 begin : LABEL_0
    #1 force id_9 = 1;
  end
endmodule

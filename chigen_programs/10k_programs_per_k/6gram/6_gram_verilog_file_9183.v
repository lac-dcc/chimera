// Seed: 2073442506
module module_0 (
    input supply0 id_0,
    output supply0 id_1,
    output uwire id_2,
    output supply1 id_3,
    output supply0 id_4,
    input tri1 id_5
);
  assign id_4 = 1;
endmodule
module module_1 (
    output supply0 id_0,
    input supply0 id_1,
    input wor id_2,
    output wor id_3,
    output wire id_4,
    input supply0 id_5,
    input tri0 id_6,
    output wire id_7,
    inout supply1 id_8
);
  assign id_8 = (1);
  wire id_10;
  reg  id_11;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_0,
      id_8,
      id_8,
      id_1
  );
  assign modCall_1.id_5 = 0;
  always id_11 = #1 1 == 1'd0 - (id_6);
endmodule

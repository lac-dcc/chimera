// Seed: 3391099492
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    output uwire id_2,
    output wand id_3,
    input tri id_4,
    output wand id_5,
    input tri1 id_6,
    output wire id_7
);
  id_9(
      id_7
  );
endmodule
module module_1 (
    input supply1 id_0,
    output tri0 id_1,
    output supply1 id_2,
    input tri id_3,
    input tri0 id_4
);
  wire id_6;
  assign id_2 = 1;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_2,
      id_1,
      id_0,
      id_2,
      id_4,
      id_2
  );
  assign modCall_1.type_2 = 0;
  genvar id_7;
  logic [7:0] id_8, id_9;
  parameter id_10 = 1;
  always id_8[1'b0]++;
endmodule

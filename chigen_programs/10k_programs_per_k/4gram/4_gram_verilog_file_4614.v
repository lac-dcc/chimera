// Seed: 3549867812
module module_0 (
    input tri1 id_0,
    input tri1 id_1,
    input wor id_2,
    output wor id_3,
    output uwire id_4,
    output tri1 id_5,
    output supply1 id_6,
    input supply1 id_7
);
  integer id_9;
  ;
  assign id_3 = 1 && id_1;
  assign id_9[-1] = (id_1 && -1'b0 ? id_2 : 'd0);
endmodule
module module_1 (
    input  uwire id_0,
    output tri1  id_1
);
  assign id_1 = id_0 - -1;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0
  );
  assign modCall_1.id_7 = 0;
  localparam id_3 = 1;
endmodule

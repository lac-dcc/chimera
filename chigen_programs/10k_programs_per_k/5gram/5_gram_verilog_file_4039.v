// Seed: 1302510730
module module_0 (
    input wor id_0,
    output wor id_1,
    output supply1 id_2,
    input tri1 id_3
);
  uwire id_5;
  always_comb @(id_3 or posedge 1) id_5 = {id_5, id_5 ^ id_5 == 1, 1'd0, 1};
endmodule
module module_1 (
    input  wor   id_0,
    output tri1  id_1,
    output uwire id_2,
    input  wor   id_3
);
  module_0 modCall_1 (
      id_3,
      id_2,
      id_1,
      id_3
  );
  assign modCall_1.type_1 = 0;
  id_5(
      .id_0(""), .id_1()
  );
  wire id_6;
endmodule

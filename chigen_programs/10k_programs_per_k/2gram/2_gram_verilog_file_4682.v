// Seed: 3155366084
module module_0 (
    output uwire id_0,
    input wor id_1,
    input wor id_2,
    input uwire id_3,
    output uwire id_4,
    output supply0 id_5,
    input tri id_6,
    input tri id_7,
    input uwire id_8
);
  assign id_4 = id_7;
endmodule
module module_1 (
    input  wire  id_0,
    output tri   id_1,
    input  tri   id_2,
    input  uwire id_3,
    input  wor   id_4,
    input  wor   id_5
);
  tri id_7;
  notif1 primCall (id_1, id_3, id_4);
  module_0 modCall_1 (
      id_1,
      id_5,
      id_5,
      id_2,
      id_1,
      id_1,
      id_5,
      id_0,
      id_2
  );
  assign modCall_1.id_4 = 0;
  assign id_7 = 1;
endmodule

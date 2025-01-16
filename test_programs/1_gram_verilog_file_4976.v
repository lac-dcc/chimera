// Seed: 3770780455
module module_0 (
    output supply1 id_0,
    input tri1 id_1,
    input wor id_2,
    input wor id_3,
    input wire id_4,
    input supply0 id_5
);
  wire id_7;
  or primCall (id_0, id_4, id_7, id_5, id_1, id_2);
  module_2 modCall_1 (id_0);
  assign modCall_1.id_3 = 0;
endmodule
module module_1 (
    inout uwire id_0,
    input tri0 id_1,
    id_7,
    output supply1 id_2,
    input tri id_3,
    output tri0 id_4,
    output tri id_5
);
  parameter id_8 = id_0 + id_7;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_3,
      id_0,
      id_3,
      id_1
  );
  assign modCall_1.id_3 = 0;
  always id_5 = id_1;
  always id_7 = -1;
  wire id_9;
endmodule
module module_2 (
    output tri1 id_0
);
  parameter id_2 = id_2;
  tri0 id_3;
  wire id_4;
  wire id_5;
  wire id_6, id_7;
  id_8(
      .id_0(1), .id_1(id_3), .id_2(-1), .id_3(-1), .id_4(id_0), .id_5(id_3), .id_6(1), .id_7(id_3)
  );
  assign id_4 = ~id_3;
  genvar id_9;
endmodule

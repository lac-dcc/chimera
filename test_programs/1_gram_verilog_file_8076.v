// Seed: 2289958364
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  id_8(
      .id_0(id_6), .id_1(id_2)
  );
  assign id_7 = 1;
  assign module_1.id_4 = 0;
endmodule
module module_1;
  wor id_1, id_2, id_4;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_2,
      id_1,
      id_4,
      id_2,
      id_4
  );
  initial
    if (id_2)
      fork
        id_3 <= -1;
      join_any
    else;
  assign id_3 = -1;
endmodule

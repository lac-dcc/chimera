// Seed: 1019954413
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  supply0 id_8 = 1 == id_7;
  supply1 id_9 = 1 == id_8, id_10;
  wire id_11;
  wire id_12;
endmodule
module module_1;
  wire id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  integer id_6 (
      .id_0(id_4 < id_2),
      .id_1(1'b0),
      .id_2(1),
      .id_3(id_5),
      .id_4(id_2),
      .id_5(1)
  );
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_2,
      id_1,
      id_2,
      id_4
  );
  id_7(
      .id_0(id_1), .id_1(1 + 1), .id_2(id_5), .id_3(1)
  );
  nor primCall (id_5, id_4, id_6, id_2, id_1);
endmodule

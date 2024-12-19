// Seed: 1683824040
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
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  supply1 id_8 = (id_7);
  assign id_8 = id_8 ? 1 : 1;
  assign id_7 = id_1;
  always if (1) deassign id_8;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  id_6(
      .id_0(id_2[1 : 1]), .id_1(id_2), .id_2(id_1), .id_3(1'b0)
  );
  always force id_3 = 1;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_1,
      id_4,
      id_1,
      id_4,
      id_5
  );
endmodule

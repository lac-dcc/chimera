// Seed: 2903168522
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = 1;
  assign module_1.id_4 = 0;
  tri1 id_5;
  assign id_5.id_2 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_5 = 1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4
  );
  id_6(
      id_5, id_4, 1, id_1, 1, 1 + id_2
  );
endmodule

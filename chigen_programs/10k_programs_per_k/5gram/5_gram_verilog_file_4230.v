// Seed: 1283231418
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_5;
  pullup id_6 (-1, 1, -1, 1'b0 == id_1);
  module_2 modCall_1 (
      id_3,
      id_1
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_2,
      id_1
  );
  assign id_2 = id_1;
endmodule
module module_2 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  assign id_2 = id_1;
endmodule

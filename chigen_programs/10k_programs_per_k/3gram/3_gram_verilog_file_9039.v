// Seed: 2999689661
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_3 = id_2 && 1;
  wire id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(*) id_3 <= 1;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_1,
      id_2
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_1
  );
endmodule

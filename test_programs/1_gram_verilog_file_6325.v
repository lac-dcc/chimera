// Seed: 1434200633
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
  assign id_2 = 1;
endmodule
module module_1;
  wire id_1;
  module_0 modCall_1 (
      id_1,
      id_1
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_4 = ~1'b0 - -1'b0;
  assign id_1 = id_3;
  module_0 modCall_1 (
      id_4,
      id_4
  );
  assign modCall_1.id_2 = 0;
  always id_3 <= 1;
  wire id_6;
endmodule

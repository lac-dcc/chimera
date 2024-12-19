// Seed: 1416468660
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_2 = 1'h0;
  uwire id_6;
  wire  id_7;
  assign id_2 = id_6;
  id_8(
      1'h0, id_5, id_1, 1, 1'b0, 1
  );
  wire id_9;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_4,
      id_3,
      id_3
  );
  assign modCall_1.type_11 = 0;
  wire id_5;
endmodule

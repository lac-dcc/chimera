// Seed: 294031830
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_6, id_7;
  uwire id_8, id_9, id_10;
  supply0 id_11;
  id_12(
      1
  );
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
  input wire id_2;
  input wire id_1;
  wire id_6;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_3,
      id_2,
      id_1
  );
  assign modCall_1.id_10 = 0;
endmodule

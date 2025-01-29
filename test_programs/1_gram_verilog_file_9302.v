// Seed: 335568433
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_6 = id_1;
  assign id_6 = id_8;
  id_10(
      id_7, ~1, id_2, id_9, -1'b0, id_9
  );
endmodule
module module_1 (
    id_1
);
  output wire id_1;
  assign id_1 = id_2;
  wire id_3;
  assign id_1 = id_2;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3
  );
  assign modCall_1.id_7 = 0;
  assign id_1 = -1;
endmodule

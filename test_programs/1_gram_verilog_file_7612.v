// Seed: 180921549
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_1 = -1;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  assign id_1 = 1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_1 = 0;
  assign id_1 = -1'b0;
  not primCall (id_1, id_2);
  id_3(
      .id_0(-1)
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  parameter integer id_9 = -1'h0;
  always id_3 <= 1'b0 | 1;
  localparam id_10 = id_6;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_10
  );
  assign modCall_1.id_1 = 0;
endmodule

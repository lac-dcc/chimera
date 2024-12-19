// Seed: 426291003
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  logic [7:0] id_5;
  assign id_4 = {id_4, 1};
  assign id_5[1'h0] = 1'b0;
  assign id_2 = 1'b0;
endmodule
module module_1 (
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
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_10;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_5,
      id_9
  );
  assign modCall_1.id_2 = 0;
  id_11(
      .id_0(1 & 1), .id_1(1)
  );
  wire id_12;
endmodule

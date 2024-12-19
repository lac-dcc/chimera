// Seed: 2456271531
module module_0 (
    id_1
);
  inout wire id_1;
  assign id_1 = 1'b0;
  wire id_2;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  always cover (id_2);
  assign id_2 = 1;
  logic [7:0] id_8;
  id_9(
      .id_0(1), .id_1(1), .id_2(id_8[1'b0]), .id_3(1'h0)
  );
  module_0 modCall_1 (id_1);
endmodule

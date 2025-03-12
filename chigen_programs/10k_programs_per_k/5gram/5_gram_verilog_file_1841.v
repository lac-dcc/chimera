// Seed: 2485981337
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_6;
  wire id_7;
  wire id_8;
  assign id_5 = id_1;
  assign module_1.id_4 = 0;
  wire id_9;
  wire id_10;
endmodule
module module_1 #(
    parameter id_2 = 32'd25
) (
    id_1,
    _id_2,
    id_3
);
  inout wire id_3;
  input wire _id_2;
  input wire id_1;
  reg [-1 'b0 : id_2] id_4, id_5;
  wire id_6;
  assign id_3 = id_6;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_6,
      id_6,
      id_6
  );
  always_latch @(id_4 > 1 % id_5 or posedge id_2) if (1) id_4 <= id_1;
endmodule

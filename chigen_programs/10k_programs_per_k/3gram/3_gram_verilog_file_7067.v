// Seed: 2702620453
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_7;
  assign id_6 = 1'd0;
  assign id_5[1] = 1'h0;
  wire id_8;
  wire id_9;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_4[1'h0] = id_2;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1,
      id_3,
      id_4,
      id_1
  );
  wire id_5;
endmodule

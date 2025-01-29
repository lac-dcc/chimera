// Seed: 717968184
module module_0 (
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
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_5 = id_7 | id_4;
  assign id_6 = 1;
  wire id_9;
  id_10(
      .id_0(1 - id_1), .id_1(1), .id_2(-1), .id_3(-1), .id_4(1)
  );
  assign module_1.id_1 = 0;
endmodule
program module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_4,
      id_1,
      id_3,
      id_5,
      id_1
  );
  initial if (1) if (id_4) id_2 <= 1 + 1'd0;
  wire id_7;
  initial id_2 = -1 - id_1;
endmodule

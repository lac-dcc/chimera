// Seed: 422951682
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7#(.id_8(1))
);
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout tri1 id_1;
  assign id_1 = 1;
  parameter id_9 = -1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  output logic [7:0] id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_1,
      id_2,
      id_1,
      id_3,
      id_5
  );
  always_ff id_4[1] <= -1'b0;
endmodule

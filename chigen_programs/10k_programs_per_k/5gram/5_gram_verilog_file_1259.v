// Seed: 128458973
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout tri0 id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_4 = -1'b0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    .id_8(id_7)
);
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_6,
      id_6
  );
  assign modCall_1.id_4 = 0;
  logic id_9;
endmodule

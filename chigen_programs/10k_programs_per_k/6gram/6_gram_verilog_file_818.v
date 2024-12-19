// Seed: 1612274962
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
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_9;
  assign id_3 = 1;
  id_10(
      .id_0((1'b0)), .id_1(id_4), .id_2(id_3), .id_3(1'd0 - 1)
  );
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_6;
  assign id_6 = id_2;
  wire id_7;
  always @($display or negedge id_3) id_4 <= id_1;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_7,
      id_3,
      id_6,
      id_6,
      id_6,
      id_6
  );
endmodule

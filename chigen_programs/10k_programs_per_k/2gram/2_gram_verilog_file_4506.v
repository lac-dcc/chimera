// Seed: 3519317977
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_5 = id_1;
  wire id_6;
  integer id_7 (.id_0(id_4));
  id_8(
      .id_0(1 <-> id_6 - id_1), .id_1(1), .id_2(id_7), .id_3(id_4), .id_4('h0)
  );
  wire id_9;
endmodule
module module_1 (
    input  wor   id_0,
    output logic id_1,
    input  wire  id_2
    , id_6,
    input  tri   id_3
    , id_7,
    input  logic id_4
);
  wire id_8;
  module_0 modCall_1 (
      id_8,
      id_8,
      id_8,
      id_8,
      id_8
  );
  assign modCall_1.id_1 = 0;
  assign id_1 = 1;
  wire id_9;
  always #1
    if (1) begin : LABEL_0
      id_6[1] = id_2;
      id_1 <= id_4;
    end
endmodule

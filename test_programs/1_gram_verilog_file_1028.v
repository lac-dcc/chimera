// Seed: 1772875133
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  supply1 id_8 = 1;
  id_9(
      id_3, -1'b0, -1, {-1}, id_2, 1
  );
  wire id_10;
  wire id_11;
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    output logic id_0,
    output logic id_1
);
  assign id_0 = 1;
  always id_1 <= id_3;
  logic [7:0][-1] id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  always id_0 <= 1;
  id_5 :
  assert property (@(posedge 1) 1) @(1 - id_3 * -1) id_1 = id_3;
endmodule

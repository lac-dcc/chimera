// Seed: 3292387750
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout tri1 id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_7 = {1{-1 + id_4, id_7}};
  wor id_8 = id_3 * 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output logic [7:0] id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  logic id_5;
  ;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_5,
      id_5,
      id_5,
      id_2,
      id_5
  );
  parameter id_6 = 1;
  assign id_4 = id_1;
  assign id_4[1'h0][(-1'b0&1)>>-1] = 1;
endmodule

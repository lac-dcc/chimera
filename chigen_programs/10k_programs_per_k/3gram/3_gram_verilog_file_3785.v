// Seed: 3169020052
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output logic [7:0] id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_8;
  always @(1'h0) id_4[-1] <= -1'h0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  inout logic [7:0] id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  always_ff @(negedge id_8) id_6[-1] <= -1'b0;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_5,
      id_6,
      id_3,
      id_7,
      id_8
  );
endmodule

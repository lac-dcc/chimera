// Seed: 3125290816
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_4 = id_2;
  assign id_4 = id_3;
  wire id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output logic [7:0] id_6;
  inout wire id_5;
  output wire id_4;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_4
  );
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_6[-1] = 1'd0;
  logic [7:0] id_7;
  assign {1, (id_1), id_7[1'h0], ~(1) == -1} = id_1;
endmodule

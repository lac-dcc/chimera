// Seed: 3866464458
macromodule module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  assign module_1.id_3 = 0;
  inout wire id_2;
  input wire id_1;
endmodule
module module_1 (
    id_1
);
  inout wire id_1;
  localparam id_2 = 1;
  reg id_3;
  localparam id_4 = 1;
  logic id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_2
  );
  id_6 :
  assert property (@(-1, negedge -1'd0 or id_5) id_4)
  else;
  assign id_3 = id_5;
  always begin : LABEL_0
    id_3 = 1;
  end
endmodule

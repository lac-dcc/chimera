// Seed: 2172175087
module module_0;
  wire id_1 = id_1;
  module_2 modCall_1 (
      id_1,
      id_1
  );
endmodule
macromodule module_1 (
    input wire  id_0,
    input wor   id_1,
    inout logic id_2,
    input wire  id_3
);
  wire id_5;
  initial begin : LABEL_0
    id_2 <= 1;
  end
  always_latch force id_5 = 1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  assign id_2 = 1;
  wire id_3;
  module_3 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_1
  );
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  reg id_5;
  reg id_6 = id_6;
  assign module_2.id_2 = 0;
  reg id_7;
  id_8 :
  assert property (@(1) id_7)
  else
    @(*)
      if (1) id_8 <= id_5;
      else id_6 <= 1'b0 != "";
endmodule

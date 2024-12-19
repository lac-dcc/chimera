// Seed: 3356371895
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  assign id_2 = id_3;
  module_2 modCall_1 ();
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_3
  );
endmodule
module module_2;
  always_latch @(1 or negedge 1) begin : LABEL_0
    id_1 <= 1;
    id_1 <= 1;
  end
endmodule
module module_3;
  module_2 modCall_1 ();
endmodule
module module_4 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  module_2 modCall_1 ();
  wire id_5;
  integer id_6;
  wire id_7;
endmodule

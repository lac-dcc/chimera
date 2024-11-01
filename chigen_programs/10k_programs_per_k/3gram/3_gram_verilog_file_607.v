// Seed: 434938410
module module_0;
  id_1(
      .id_0(1 && id_2), .id_1(1), .id_2()
  );
endmodule
program module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  assign id_2 = 1;
  module_0();
  assign id_2 = id_1;
  wire id_3;
endprogram
module module_2 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  wire id_3;
  module_0();
endmodule
module module_3;
  logic [7:0] id_2;
  logic [7:0] id_3;
  assign id_3[1+:-1] = id_2[1'b0 : 1];
  module_0();
endmodule

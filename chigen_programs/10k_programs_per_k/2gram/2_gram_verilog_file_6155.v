// Seed: 1024222013
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  assign id_2 = &1'b0;
  wire id_3;
  assign id_2 = id_1;
endmodule
macromodule module_1 (
    id_1
);
  inout wire id_1;
  reg id_2;
  always_comb id_2 <= 1;
  assign id_2 = 1;
  module_0(
      id_1, id_1
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_6 = 1;
  module_0(
      id_5, id_6
  );
  always begin
    id_7 <= 1;
  end
endmodule

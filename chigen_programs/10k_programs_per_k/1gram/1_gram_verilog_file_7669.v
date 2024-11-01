// Seed: 3462092020
macromodule module_0 (
    output logic id_0,
    input  logic id_1
);
  always_comb id_0 <= id_1;
endmodule
module module_1 (
    input  logic id_0,
    output uwire id_1,
    output logic id_2
);
  always begin
    id_2 = id_0;
    @(1 ? id_0 : 1 - (id_0) or posedge id_0 & 1) @(posedge 1 != 1 !=? (0)) id_2 = 1;
  end
  module_0(
      id_2, id_0
  );
  initial id_2 <= id_0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_3 = 1;
  assign id_2 = id_4;
  module_2(
      id_3, id_3, id_4, id_4, id_4
  );
endmodule

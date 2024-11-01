// Seed: 1247161035
macromodule module_0 (
    id_1
);
  inout wire id_1;
  reg id_2;
  always
    if (id_2) begin
      id_1 = (id_1);
      id_2 <= 1;
    end else begin
      id_2 <= 1'd0;
    end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  nand (id_4, id_7, id_6, id_2, id_3);
  module_0(
      id_6
  );
endmodule

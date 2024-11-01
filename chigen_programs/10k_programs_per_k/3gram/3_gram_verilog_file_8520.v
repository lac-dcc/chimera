// Seed: 481546360
macromodule module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_5 = (id_2);
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  always_latch @(1 ^ 1 or id_1) begin
    id_2 = 1;
  end
  module_0(
      id_2, id_2, id_2, id_2, id_2, id_2
  );
endmodule
module module_2 (
    output uwire id_0,
    input  uwire id_1,
    output tri0  id_2,
    input  tri0  id_3,
    input  wor   id_4
);
  assign id_2 = id_3;
  assign id_0 = 1 & 1;
  always @(negedge 1);
  assign id_0 = 1;
  wire id_6;
endmodule
module module_3 (
    output uwire id_0,
    output tri1 id_1,
    input wand id_2,
    input wand id_3,
    input supply1 id_4,
    inout wor id_5
);
  id_7();
  nand (id_5, id_3, id_7, id_2, id_4);
  module_2(
      id_0, id_5, id_5, id_2, id_5
  );
endmodule

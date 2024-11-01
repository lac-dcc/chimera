// Seed: 426879145
macromodule module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_6;
endmodule
module module_1 (
    output wand id_0,
    input  wire id_1
);
  wire id_3;
  module_0(
      id_3, id_3, id_3, id_3, id_3
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  logic [7:0] id_6;
  nor (id_1, id_3, id_2, id_6, id_5, id_4);
  module_0(
      id_3, id_5, id_4, id_2, id_2
  ); id_7 :
  assert property (@(posedge !1) id_4 - 1'b0)
  else id_1 <= id_6[1];
endmodule

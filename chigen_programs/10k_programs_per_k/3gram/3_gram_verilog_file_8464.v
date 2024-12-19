// Seed: 3973900067
module module_0;
  wire id_2;
  assign module_3.type_6 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(negedge id_5) disable id_9;
  module_0 modCall_1 ();
endmodule
module module_2;
  always @(*);
  module_0 modCall_1 ();
  wire id_1, id_2;
endmodule
module module_3 (
    input  logic id_0,
    input  wand  id_1,
    output wire  id_2
);
  id_4 :
  assert property (@(negedge id_0) 1'b0)
  else id_2 = id_0 * 1 + id_0;
  initial
    for (id_2 = id_4; id_0; id_2 = 1'b0) begin : LABEL_0
      id_4 <= 1;
    end
  module_0 modCall_1 ();
endmodule

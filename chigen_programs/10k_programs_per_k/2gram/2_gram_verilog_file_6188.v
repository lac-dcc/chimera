// Seed: 1134232361
module module_0 ();
  reg id_2;
  always_ff begin : LABEL_0
    fork
      id_1 <= #1 id_2;
    join_any
  end
endmodule
module module_1 (
    id_1,
    id_2#(1),
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  id_9 :
  assert property (@(posedge id_6) id_9)
  else;
  assign id_4 = 1'b0;
  assign id_3 = id_7;
  assign id_9 = 1 | id_8 | id_9;
  assign id_9 = 1'b0;
  wire id_10;
  wire id_11;
  module_0 modCall_1 ();
endmodule

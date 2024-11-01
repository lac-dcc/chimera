// Seed: 1145787469
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_11, id_12;
  id_13 :
  assert property (@(posedge id_6) 1)
  else $display(1'h0);
  always_ff repeat (-id_13) id_10 = 1;
  wire id_14;
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
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_6 = 1;
  module_0(
      id_8, id_5, id_6, id_1, id_7, id_5, id_6, id_6, id_8, id_1
  );
endmodule

// Seed: 2574743201
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  logic id_7;
  ;
endmodule
module module_1 #(
    parameter id_2 = 32'd52
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire _id_2;
  inout logic [7:0] id_1;
  wire id_7;
  id_8 :
  assert property (@(posedge id_1[id_2]) -1)
  else $clog2(71);
  ;
  wire  id_9;
  logic id_10 = id_8;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_10,
      id_9,
      id_6,
      id_4
  );
endmodule

// Seed: 1537454387
module module_0;
  wire id_1;
  assign module_1.type_12 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    input logic id_1,
    input wire id_2,
    output tri1 id_3,
    output logic id_4,
    output uwire id_5,
    input logic id_6
);
  final @(posedge id_1) id_4 <= (id_6);
  assign id_3 = 1;
  wire id_8;
  wire id_9;
  module_0 modCall_1 ();
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
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  always_ff wait (1) @(posedge ((id_1[1]))) id_5 = 1;
  id_8 :
  assert property (@(posedge -1) -1) id_7 <= id_5;
  assign id_4 = id_6;
  assign id_3 = id_8;
  logic [7:0] id_9 = id_1;
  assign id_7 = 1;
  module_0 modCall_1 ();
endmodule

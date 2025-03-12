// Seed: 381863476
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign module_1.id_4 = 0;
  assign id_4 = id_5;
  logic id_7, id_8;
  integer id_9;
endmodule
module module_1 #(
    parameter id_0 = 32'd36
) (
    input  wand _id_0,
    output tri  id_1
);
  assign id_1 = id_0;
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
  logic [1  -  -1 : id_0] id_4;
  always @(posedge id_0 or negedge 1) id_4 = #1 id_0;
endmodule

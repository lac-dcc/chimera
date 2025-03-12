// Seed: 2161884999
module module_0;
  logic [7:0] id_1;
  always_latch id_1[-1] <= id_1;
  wire id_2;
  parameter id_3 = !-1'b0;
  assign module_1.id_1 = 0;
endmodule
module module_1 #(
    parameter id_1 = 32'd31,
    parameter id_2 = 32'd93
) (
    _id_1,
    _id_2[id_1(id_2) : id_1],
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  output wire id_3;
  module_0 modCall_1 ();
  input logic [7:0] _id_2;
  input wire _id_1;
  logic id_6;
endmodule
program module_2 (
    output tri1 id_0,
    input wire id_1,
    input uwire id_2,
    input wire id_3,
    output wire id_4,
    input supply1 id_5,
    output tri1 id_6,
    output tri1 id_7
);
  logic id_9;
  ;
  assign id_0 = id_2;
endprogram
module module_3 (
    input supply1 id_0,
    output tri id_1
);
  always begin : LABEL_0
    `define pp_3 0
  end
  wire id_4;
  module_2 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_1
  );
  parameter id_5 = 1;
  logic id_6;
  ;
  logic id_7;
  ;
  assign id_7 = id_5;
endmodule

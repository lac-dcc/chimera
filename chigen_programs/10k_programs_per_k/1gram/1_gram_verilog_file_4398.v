// Seed: 2926192355
module module_0;
  logic id_1;
  module_2 modCall_1 (id_1);
endmodule
program module_1 (
    id_1
);
  output tri1 id_1;
  assign id_1 = 1;
  wire [1 'b0 : 1 'b0] id_2;
  module_0 modCall_1 ();
  assign id_1 = id_2;
  wire [1 : 1] id_3;
endprogram
module module_2 (
    id_1
);
  input wire id_1;
  task id_2;
    input id_3;
  endtask
  wire id_4;
endmodule
module module_3 #(
    parameter id_1 = 32'd36,
    parameter id_2 = 32'd53
) (
    _id_1,
    _id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output reg id_4;
  inout wire id_3;
  inout wire _id_2;
  inout wire _id_1;
  assign id_1 = id_5;
  module_2 modCall_1 (id_5);
  assign modCall_1.id_3 = 0;
  logic id_6;
  ;
  wire id_7 = id_6;
  initial if (-1) id_4 = id_6;
  assign id_7 = id_1;
  wand [1 : id_1  .  id_2] id_8 = 1, id_9 = id_5, id_10 = -1;
  logic id_11 = id_5;
  wire [id_1 : 1] id_12 = id_9;
endmodule

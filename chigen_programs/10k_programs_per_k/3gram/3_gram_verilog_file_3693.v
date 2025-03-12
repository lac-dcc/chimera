// Seed: 3523707676
macromodule module_0 #(
    parameter id_1 = 32'd95
) ();
  wire _id_1;
  reg [{  -1  ,  id_1  }  &&  1  ?  id_1  ^  id_1 : id_1 : 1] id_2;
  logic id_3;
  ;
  parameter id_4 = 1;
  always #1 id_2 <= id_1;
endmodule
module module_1 #(
    parameter id_2 = 32'd96,
    parameter id_3 = 32'd75,
    parameter id_4 = 32'd88,
    parameter id_6 = 32'd57
) (
    id_1,
    _id_2,
    _id_3,
    _id_4
);
  inout wire _id_4;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  output wire _id_3;
  output wire _id_2;
  output wire id_1;
  wire [id_4 : -1] id_5;
  logic [-1 'b0 +  id_2 : id_3] _id_6;
  ;
  wire id_7;
  wire id_8;
  wire [id_6 : -1 'h0] id_9;
  assign id_9 = id_6 << 1 - id_7;
endmodule

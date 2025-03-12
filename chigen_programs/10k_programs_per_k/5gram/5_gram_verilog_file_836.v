// Seed: 382885528
module module_0 #(
    parameter id_3 = 32'd75
) (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  localparam id_3 = 1;
  tri [id_3 : (  -1 'h0 )] id_4, id_5, id_6, id_7;
  assign id_5 = $realtime ? 'b0 : -1;
  wire id_8;
  wire id_9;
endmodule
module module_1 #(
    parameter id_1  = 32'd37,
    parameter id_11 = 32'd62
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  output wire id_8;
  input wire id_7;
  input logic [7:0] id_6;
  inout wire id_5;
  inout logic [7:0] id_4;
  output wire id_3;
  module_0 modCall_1 (
      id_5,
      id_7
  );
  assign modCall_1.id_5 = 0;
  inout logic [7:0] id_2;
  input wire _id_1;
  specify
    (posedge id_10 => (_id_11 +: -1)) = (-1, {1, 1} == (-1'b0): -1'b0 : -1);
    (id_12 => id_13) = (-1'b0 : id_2.id_6  : 1'b0, -1  : id_4[id_11] : id_6[id_1==1]);
    (id_14 => id_15) = 1;
  endspecify
endmodule

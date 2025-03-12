// Seed: 1585325295
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  parameter id_10 = {1, 1};
endmodule
module module_1 #(
    parameter id_14 = 32'd89,
    parameter id_2  = 32'd59,
    parameter id_4  = 32'd6,
    parameter id_5  = 32'd10,
    parameter id_6  = 32'd16,
    parameter id_8  = 32'd24,
    parameter id_9  = 32'd9
) (
    input supply0 id_0,
    input wor id_1,
    input supply1 _id_2,
    output wire id_3,
    input supply1 _id_4,
    input supply0 _id_5,
    output tri1 _id_6,
    input uwire id_7
    , id_12,
    output wire _id_8,
    input wand _id_9,
    input supply1 id_10
);
  wire [id_2 : 1] id_13;
  logic [id_5  -  id_9 : id_4] _id_14;
  ;
  wire id_15;
  tri1 [id_9 : 1 'b0] id_16;
  nand primCall (id_3, id_16, id_10, id_15, id_1, id_13, id_7);
  always @(negedge id_0) begin : LABEL_0
    $unsigned(61);
    ;
  end
  assign id_16 = -1;
  module_0 modCall_1 (
      id_12,
      id_12,
      id_13,
      id_12,
      id_15,
      id_12,
      id_16,
      id_16,
      id_12
  );
  logic [id_14 : (  id_6  )] id_17;
  assign id_3 = -1;
  logic [id_8 : 1] id_18;
endmodule

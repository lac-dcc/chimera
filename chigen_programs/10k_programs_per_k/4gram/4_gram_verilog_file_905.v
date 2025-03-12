// Seed: 438879276
module module_0 #(
    parameter id_4 = 32'd18,
    parameter id_5 = 32'd21,
    parameter id_7 = 32'd70
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  input wire _id_4;
  inout wire id_3;
  inout logic [7:0] id_2;
  input wire id_1;
  wire _id_5;
  wire id_6;
  wire [1 : 1] _id_7;
  assign id_6 = 1'b0;
  assign id_6 = 1 == id_6++;
  wire [1 'h0 : -1 'h0 -  -1] id_8;
  assign id_2[id_4-id_5] = id_1;
  wire id_9;
  ;
  logic [id_7 : id_5] id_10;
endmodule
program module_1 #(
    parameter id_4 = 32'd57
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  inout wire _id_4;
  input wire id_3;
  inout uwire id_2;
  inout logic [7:0] id_1;
  assign id_1[1] = -1;
  assign id_2 = 1;
  if (1'b0) assign id_4 = id_3;
  assign id_1[id_4] = 1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_2,
      id_4
  );
  assign modCall_1.id_7 = 0;
endprogram

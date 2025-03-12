// Seed: 1547288533
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout logic [7:0] id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_4[1'h0] = id_2;
  assign id_3 = id_4;
endmodule
module module_1 #(
    parameter id_2 = 32'd62,
    parameter id_5 = 32'd23
) (
    id_1,
    _id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  input wire _id_2;
  inout logic [7:0] id_1;
  wire _id_5;
  logic [7:0][1  -  -1 'b0 : id_5] id_6;
  assign id_1[1'h0] = id_6[id_2];
  wire id_7;
  logic [7:0] id_8;
  assign id_8[1<1 : id_5] = 1 ? id_5 == -1 : id_6 == id_6;
  module_0 modCall_1 (
      id_4,
      id_7,
      id_7,
      id_6
  );
  logic [-1 : 1] id_9;
  ;
endmodule

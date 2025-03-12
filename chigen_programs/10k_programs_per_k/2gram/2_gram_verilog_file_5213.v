// Seed: 1688069641
module module_0;
  parameter ["" : -1] id_1 = -1;
endmodule
module module_1 #(
    parameter id_6 = 32'd68
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8
);
  inout logic [7:0] id_8;
  output wire id_7;
  inout wire _id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  always begin : LABEL_0
    id_8[id_6 : 1'h0] <= -1;
  end
  id_9(
      1, 1, id_3
  );
  wire id_10;
  wire id_11;
  assign id_9 = 1 ? 1 : id_6 ? id_10 : id_8;
  module_0 modCall_1 ();
endmodule

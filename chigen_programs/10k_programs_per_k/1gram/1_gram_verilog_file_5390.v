// Seed: 3058256513
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  assign module_1.id_7 = 0;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  genvar id_7;
  for (id_8 = id_6; -1; id_7 = id_4) begin : LABEL_0
    assign id_2 = id_8;
  end
  wand [1 'd0 : -1] id_9 = (id_4), id_10 = -1'b0;
endmodule
module module_1 #(
    parameter id_1 = 32'd96,
    parameter id_7 = 32'd81,
    parameter id_8 = 32'd30
) (
    _id_1,
    id_2,
    id_3,
    id_4[id_1 : id_8],
    id_5,
    id_6,
    _id_7,
    _id_8
);
  output wire _id_8;
  inout wire _id_7;
  inout wire id_6;
  inout wire id_5;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_6,
      id_5,
      id_5,
      id_5
  );
  inout logic [7:0] id_4;
  output wire id_3;
  output wire id_2;
  inout wire _id_1;
  wire ['d0 : -1  *  id_7] id_9;
  wire id_10;
  ;
endmodule

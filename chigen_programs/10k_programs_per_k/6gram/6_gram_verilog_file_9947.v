// Seed: 3426325981
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout uwire id_2;
  input wire id_1;
  assign id_2 = -1;
  assign id_5 = -1;
endmodule
module module_1 #(
    parameter id_10 = 32'd55,
    parameter id_9  = 32'd93
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    _id_10,
    id_11
);
  inout wire id_11;
  inout wire _id_10;
  inout wire _id_9;
  module_0 modCall_1 (
      id_4,
      id_11,
      id_11,
      id_11,
      id_4,
      id_3,
      id_2
  );
  output wire id_8;
  output wire id_7;
  output wire id_6;
  inout reg id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire [id_10  ==  id_9 : 1 'd0] id_12;
  always @(posedge id_4 or posedge id_9) begin : LABEL_0
    id_5 <= id_4;
  end
  assign id_9 = id_10;
endmodule

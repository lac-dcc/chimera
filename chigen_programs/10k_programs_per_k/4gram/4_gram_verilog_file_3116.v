// Seed: 2721367075
module module_0 #(
    parameter id_5 = 32'd82
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire _id_5;
  bit  id_6;
  ;
  wire id_7;
  always @(*) begin : LABEL_0
    id_6 <= id_5 - -1;
  end
  logic [1 : id_5] id_8;
  ;
endmodule
module module_0 #(
    parameter id_3 = 32'd15,
    parameter id_5 = 32'd21
) (
    id_1,
    id_2,
    module_1,
    id_4,
    _id_5,
    id_6
);
  input wire id_6;
  output wire _id_5;
  input wire id_4;
  input wire _id_3;
  inout logic [7:0] id_2;
  output wire id_1;
  logic [1 'h0 : id_5] id_7;
  assign id_2 = id_7;
  assign id_7 = id_2[id_3];
  wire id_8;
  wire [-1 : -1] id_9;
  module_0 modCall_1 (
      id_1,
      id_8,
      id_9,
      id_1
  );
  assign modCall_1.id_6 = 0;
endmodule

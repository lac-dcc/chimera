// Seed: 3613062960
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  output reg id_9;
  output wand id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  assign module_1.id_9 = 0;
  output wire id_4;
  inout wand id_3;
  output wire id_2;
  output wire id_1;
  assign id_3 = 1'b0;
  assign id_3 = 1;
  assign id_8 = 1;
  always @(*) begin : LABEL_0
    id_9 = id_7 < 1'b0;
  end
endmodule
module module_1 #(
    parameter id_8 = 32'd57,
    parameter id_9 = 32'd14
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    _id_9,
    id_10,
    id_11
);
  inout wire id_11;
  inout wire id_10;
  xor primCall (id_2, id_11, id_4, id_6, id_10);
  output wire _id_9;
  output wire _id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  inout logic [7:0] id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  bit id_12;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_10,
      id_7,
      id_3,
      id_7,
      id_10,
      id_10,
      id_12,
      id_10,
      id_10,
      id_1
  );
  always
    repeat (id_11) begin : LABEL_0
      id_12 <= -1;
    end
endmodule

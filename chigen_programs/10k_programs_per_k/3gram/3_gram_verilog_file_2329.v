// Seed: 121678152
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire [(  1 'b0 ) : 1] id_7;
endmodule
module module_1 #(
    parameter id_8 = 32'd55
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    id_9,
    id_10,
    id_11
);
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire _id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  inout wand id_4;
  output wire id_3;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_4,
      id_10,
      id_4,
      id_7
  );
  input wire id_2;
  output reg id_1;
  id_12 :
  assert property (@(posedge id_10) id_7)
  else if (1) begin : LABEL_0
    $signed(77);
    ;
    id_1 <= id_4 & id_4;
  end
  assign id_3  = id_8;
  assign id_11 = {!-1{id_11}};
  wire [1 'b0 : id_8] id_13;
  assign id_4 = 1;
  assign id_3 = id_11;
endmodule

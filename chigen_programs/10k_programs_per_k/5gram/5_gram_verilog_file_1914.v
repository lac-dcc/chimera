// Seed: 2990006371
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_9;
endmodule
module module_1 #(
    parameter id_5 = 32'd13,
    parameter id_8 = 32'd33
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    _id_8,
    id_9,
    id_10,
    id_11
);
  output wire id_11;
  nor primCall (id_10, id_1, id_3, id_7);
  output wire id_10;
  output wire id_9;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_10,
      id_1,
      id_3,
      id_2,
      id_7,
      id_10
  );
  inout wire _id_8;
  inout wire id_7;
  output wire id_6;
  inout wire _id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  always @(posedge id_8 ^ id_7) begin : LABEL_0
    $signed(92);
    ;
  end
  wire id_12;
  wire [id_8  *  id_5 : -1] id_13 = id_1;
endmodule

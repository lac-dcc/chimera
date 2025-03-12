// Seed: 3376684977
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign module_1.id_10 = 0;
endmodule
module module_1 #(
    parameter id_1 = 32'd95
) (
    _id_1,
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
    id_12,
    id_13
);
  input wire id_13;
  inout wire id_12;
  inout logic [7:0] id_11;
  input wire id_10;
  input wire id_9;
  inout logic [7:0] id_8;
  output wire id_7;
  inout logic [7:0] id_6;
  output wire id_5;
  input wire id_4;
  inout logic [7:0] id_3;
  inout wire id_2;
  inout wire _id_1;
  always @(~id_3 or posedge {id_12, id_9} + 1) begin : LABEL_0
    $clog2(50);
    ;
  end
  always @(posedge id_8 or posedge 1) begin : LABEL_1
    if (1) id_6[~-1'b0 :-1] = -1;
  end
  assign id_8[""] = id_4 == 1;
  assign id_3[1]  = -1;
  wire id_14;
  always force id_6 = id_13;
  assign id_11[(id_1==1'h0)] = id_6;
  module_0 modCall_1 (
      id_2,
      id_12,
      id_9,
      id_5
  );
  assign id_5 = -1;
endmodule

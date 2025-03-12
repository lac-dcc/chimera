// Seed: 2538142422
module module_0 (
    input supply1 module_0,
    input tri0 id_1,
    output tri0 id_2,
    output wor id_3,
    input wire id_4,
    output wand id_5,
    input wand id_6,
    input tri id_7,
    output uwire id_8
);
  wire id_10;
  wire id_11;
  assign id_3 = 1;
endmodule
module module_1 (
    input  uwire id_0,
    output tri0  id_1
);
  assign id_1 = id_0;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_2 (
    id_1
);
  inout wire id_1;
  logic [1 : 1] id_2;
  logic id_3;
  ;
  assign id_3 = id_2 == -1;
  always @(negedge id_2 or posedge id_1) begin : LABEL_0
    id_2 = 1'b0;
    id_3 <= id_2 * -1;
  end
endmodule
module module_3 #(
    parameter id_2 = 32'd22
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  input wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  output logic [7:0] id_5;
  input wire id_4;
  module_2 modCall_1 (id_7);
  assign modCall_1.id_2 = 0;
  inout logic [7:0] id_3;
  inout wire _id_2;
  output wire id_1;
  wire id_12;
  wire id_13;
  assign id_5[1] = -1'b0;
  assign id_3[id_2] = id_6;
endmodule

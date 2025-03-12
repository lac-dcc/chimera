// Seed: 2586331367
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
    id_11
);
  output wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  reg id_12, id_13;
  always @(posedge id_8) begin : LABEL_0
    id_12 <= (1'd0);
  end
endmodule
module module_0 #(
    parameter id_1 = 32'd82,
    parameter id_3 = 32'd58
) (
    module_1,
    id_2,
    _id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout logic [7:0] id_4;
  input wire _id_3;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_2,
      id_2,
      id_2,
      id_2,
      id_5,
      id_5,
      id_5,
      id_2,
      id_2
  );
  inout wire id_2;
  input wire _id_1;
  logic [-1 : -1] id_6;
  assign id_6 = id_4;
  logic id_7 = "";
  wire  id_8;
  reg   id_9;
  parameter id_10 = 1 ? 1 : 1;
  parameter [1 : id_1  ==  1 'b0 +  -1] id_11 = id_10;
  always @(posedge -1 or negedge !id_4[id_3]) begin : LABEL_0
    id_9 = #id_12 id_6;
  end
  assign id_4[id_1] = id_11;
endmodule

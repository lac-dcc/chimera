// Seed: 241647754
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
    id_12,
    id_13,
    id_14,
    id_15
);
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  input wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wor id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  always_comb @(posedge -1) begin : LABEL_0
  end
  wire  id_16;
  wire  id_17;
  logic id_18;
  ;
  assign id_5 = -1'b0;
endmodule
module module_1 #(
    parameter id_1 = 32'd57,
    parameter id_3 = 32'd74
) (
    _id_1,
    id_2,
    _id_3,
    id_4,
    id_5
);
  inout logic [7:0] id_5;
  output logic [7:0] id_4;
  input wire _id_3;
  output wire id_2;
  inout wire _id_1;
  wire id_6;
  initial begin : LABEL_0
    id_4[id_3 : id_3] <= -1;
  end
  nor primCall (id_2, id_5, id_7);
  logic [7:0][id_1 : -1] id_7;
  assign id_5[1] = id_7[-1];
  module_0 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6
  );
  initial assume (id_6);
  wire id_8;
  ;
  wire id_9;
endmodule

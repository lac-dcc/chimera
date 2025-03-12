// Seed: 257224419
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  logic [7:0] id_8, id_9;
  assign id_8[1] = id_6;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input  tri   id_0,
    output logic id_1,
    output tri   id_2,
    input  wire  id_3,
    input  wand  id_4,
    input  uwire id_5,
    input  wor   id_6,
    input  wor   id_7,
    input  tri   id_8,
    output logic id_9
);
  always @(posedge "" ~^ (~id_4) or negedge 1'd0) begin : LABEL_0
    id_1 <= id_5 == -1;
    if (1'h0) id_1 <= 1;
    else begin : LABEL_1
      id_9 <= id_0;
    end
  end
  initial begin : LABEL_2
    id_1 <= id_0;
    $unsigned(40);
    ;
    id_9 <= 1'b0;
  end
  assign id_9 = 1;
  wire id_11;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_11,
      id_11,
      id_11,
      id_11,
      id_11
  );
endmodule

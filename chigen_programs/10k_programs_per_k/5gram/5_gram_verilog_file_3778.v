// Seed: 983569946
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_1 = id_2;
  wire id_4 = id_3;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  logic [7:0] id_6;
  xnor primCall (id_1, id_4, id_2, id_6, id_5);
  always_latch @(negedge 1 - 1, negedge id_5 | 1 or posedge 1) begin : LABEL_0
    id_5 <= id_2++;
  end
  module_0 modCall_1 (
      id_2,
      id_1,
      id_3
  );
  always @(negedge 1) begin : LABEL_0
    id_6[1] <= id_4;
  end
  wire id_7;
endmodule

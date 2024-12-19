// Seed: 2121680208
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
    id_10
);
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  final $display(1'b0, id_6[1'h0]);
endmodule
module module_1 (
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
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  logic [7:0] id_9 = id_1;
  id_10(
      .id_0(~1'b0), .id_1(), .id_2(1), .id_3(!id_1[1]), .id_4((1)), .id_5(!1 - 1), .id_6(1)
  );
  module_0 modCall_1 (
      id_7,
      id_6,
      id_5,
      id_7,
      id_5,
      id_9,
      id_2,
      id_2,
      id_2,
      id_6
  );
  always @(negedge 1 or posedge 1) begin : LABEL_0
    id_6 = 1 - 1;
  end
endmodule

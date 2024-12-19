// Seed: 1379723807
module module_0 (
    id_1,
    module_0,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_9;
  always @(id_3 or posedge (|id_7)) begin : LABEL_0
    id_1 <= 1'd0 + 1;
  end
  id_10(
      .id_0(id_3)
  );
  wire id_11;
  wire id_12;
  wire id_13 = id_4;
  wire id_14;
  id_15(
      .id_0(1), .id_1(1'b0 == 1), .id_2(id_5), .id_3(1'b0), .id_4(id_13), .id_5(1'd0)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(negedge 1) begin : LABEL_0
    id_1 <= id_4;
  end
  xnor primCall (id_2, id_4, id_1, id_3);
  module_0 modCall_1 (
      id_4,
      id_3,
      id_2,
      id_3,
      id_3,
      id_2,
      id_3,
      id_2
  );
endmodule

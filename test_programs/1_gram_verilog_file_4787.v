// Seed: 3454555646
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_2 = id_1;
  wire id_6;
  wire id_7;
endmodule
macromodule module_1 (
    id_1
);
  inout wire id_1;
  wire id_2;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_2
  );
  if (id_1) localparam id_3 = "";
endmodule
macromodule module_2 (
    output tri1  id_0,
    input  logic id_1,
    input  logic id_2,
    input  wire  id_3,
    input  tri0  id_4,
    input  uwire id_5
);
  always id_0.id_3 -= -1;
  always {1, id_1} <= -1;
  logic id_7, id_8, id_9;
  reg id_10, id_11;
  reg id_12;
  always id_11 <= id_7;
  wire id_13;
  module_0 modCall_1 (
      id_13,
      id_13,
      id_13,
      id_13,
      id_13
  );
  id_14 :
  assert property (@(posedge (id_8) or id_2) 1'b0 && -1'b0 + 1) begin : LABEL_0
    begin : LABEL_0
      id_12 <= 1;
      id_13++;
    end : SymbolIdentifier
  end
  wire id_15;
  id_16(
      1
  ); id_17(
      .id_0(-1'd0), .id_1("" - -1), .id_2(1), .id_3(-1)
  );
endmodule

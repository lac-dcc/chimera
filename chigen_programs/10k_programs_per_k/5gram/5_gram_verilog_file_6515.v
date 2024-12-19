// Seed: 1965834955
module module_0 (
    input logic id_0,
    output logic id_1,
    input uwire id_2,
    input supply0 id_3,
    input wand id_4,
    input tri id_5
);
  initial begin : LABEL_0
    id_1 <= 1'h0 ^ 1;
    {1'b0, id_5} = 1'b0;
  end
  wire id_7;
  wire id_8;
  assign id_1 = id_0;
endmodule
module module_1 (
    inout  logic id_0,
    input  logic id_1,
    input  tri   id_2,
    output wire  id_3,
    input  tri   id_4
);
  assign id_0 = 1 ? 1'b0 : 1;
  assign id_3 = id_2;
  reg  id_6;
  wire id_7;
  reg  id_8;
  always @(posedge 1) begin : LABEL_0
    id_6 <= id_0;
    id_8 <= id_8;
    id_3 = 1'h0;
    if (id_1) id_6 <= id_1;
  end
  assign id_6 = 1'b0;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_4,
      id_2,
      id_4,
      id_4
  );
  wire id_9;
endmodule

// Seed: 3174858018
module module_0 (
    input  wire  id_0,
    output logic id_1
);
  initial begin : LABEL_0
    id_1 = 1;
    id_1 <= 1'b0 & 1'b0;
    {1} += id_0;
  end
endmodule
module module_1 (
    output wor   id_0,
    input  uwire id_1,
    input  wand  id_2,
    output wire  id_3,
    output logic id_4
);
  module_0 modCall_1 (
      id_2,
      id_4
  );
  logic id_6, id_7;
  always @(posedge 1 or posedge id_1) begin : LABEL_0
    #1;
    id_7 <= 1'b0;
    #1;
    if (1) begin : LABEL_0
      if (1) begin : LABEL_0
        id_4 <= 1;
      end
    end
  end
  assign id_0 = 1;
  assign id_6 = id_7 ? 0 : (1'h0);
  assign id_4 = id_6;
endmodule

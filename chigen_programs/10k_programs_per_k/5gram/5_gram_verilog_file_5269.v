// Seed: 2614149842
module module_1 (
    output uwire id_0,
    input logic module_0,
    output logic id_2,
    output wire id_3,
    input wand id_4,
    output tri id_5,
    input tri0 id_6,
    input supply1 id_7,
    output tri id_8,
    output supply1 id_9,
    input supply1 id_10,
    input wor id_11,
    output wor id_12,
    input uwire id_13,
    output wor id_14
);
  tri1 id_16;
  always_comb @(id_10 or posedge 1) begin : LABEL_0
    if (id_6) begin : LABEL_0
    end
  end
  logic [7:0] id_17;
  initial begin : LABEL_0
    if (1) begin : LABEL_0
      if (1) id_5 = 1 && 1 === 1;
    end else begin : LABEL_0
      id_17[1] <= {1{id_1}};
      if (id_16) begin : LABEL_0
        id_2 <= #1 1;
      end
    end
  end
endmodule
module module_1 (
    input  logic id_0,
    output tri1  id_1,
    input  wire  id_2
);
  logic id_4 = id_0;
  assign id_1 = 1 + 1;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_4,
      id_1,
      id_2,
      id_1,
      id_2,
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1,
      id_2,
      id_1
  );
  assign modCall_1.id_0 = 0;
  always @(1 or posedge 1) begin : LABEL_0
    disable id_5;
    id_4 <= id_5;
  end
endmodule

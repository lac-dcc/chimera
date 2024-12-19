// Seed: 4146465320
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  initial
    if (id_4) id_1 = #1 1;
    else begin : LABEL_0
      if (id_3) begin : LABEL_0
        if (1) id_3 <= id_2;
      end
    end
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input uwire id_0,
    input tri   id_1,
    input logic id_2,
    input wor   id_3,
    input tri1  id_4,
    input tri   id_5
);
  wire id_7, id_8;
  wire id_9;
  wire id_10;
  reg  id_11;
  for (id_12 = id_12; 1 && 1; id_12 = id_0) begin : LABEL_0
    assign id_12 = 1;
    always
      assert (id_12) begin : LABEL_0
        id_11 <= id_2;
      end
  end
  module_0 modCall_1 (
      id_11,
      id_11,
      id_11,
      id_8,
      id_9
  );
  wire id_13;
endmodule

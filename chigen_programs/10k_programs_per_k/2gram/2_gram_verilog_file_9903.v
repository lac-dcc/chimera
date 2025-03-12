// Seed: 2841271857
macromodule module_0 ();
  wire [-1 : 1] id_1;
  assign module_1.id_13 = 0;
endmodule
module module_1 (
    input wor id_0,
    input tri1 id_1,
    input supply0 id_2,
    input tri id_3,
    input wire id_4,
    output logic id_5,
    output logic id_6
    , id_9,
    output logic id_7
);
  parameter id_10 = -1;
  assign id_5 = 1;
  initial begin : LABEL_0
    id_9 = (id_3 - id_0);
    id_6 <= id_10;
    if ("") id_5 = -1'd0;
    else id_6 <= #1 id_0;
    if (-1 != "")
      @(posedge 1 or posedge -1'b0 - 1 or negedge -1) begin : LABEL_1
        id_9 <= id_10 - -1;
        id_9 <= 1;
      end
    else if (1) id_7 = 1;
    id_7 <= (id_1);
  end
  always begin : LABEL_2
    id_9 = id_9;
  end
  module_0 modCall_1 ();
  if (-1) begin : LABEL_3
    logic id_11;
  end
  logic id_12 = "";
  for (id_13 = -1; id_2; id_7 = 1) begin : LABEL_4
    assign id_5 = id_12#(
        .id_3 (-1),
        .id_10(-1),
        .id_3 (id_10),
        .id_3 (id_7++)
    ) ==? (id_10);
  end
endmodule

// Seed: 3196295015
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
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_3 = 1'b0 || id_1 == id_3 ? (id_1) == id_3 : 1 == 1;
endmodule
module module_1 (
    input  logic id_0,
    output logic id_1,
    output logic id_2,
    input  logic id_3,
    input  logic id_4,
    input  logic id_5,
    input  logic id_6,
    output logic id_7,
    input  wire  id_8,
    input  tri0  id_9,
    input  logic id_10
);
  always begin : LABEL_0
    if (1) begin : LABEL_0
      if (id_6) disable id_12;
      id_2 <= 1 == 1'b0;
    end else begin : LABEL_0
      if (id_9 == 1) begin : LABEL_0
        wait (id_4);
        fork
          id_7 <= (1) ? {id_3, id_6, 1, 1} : id_6;
          id_13(1);
        join_none
      end
    end
  end
  logic id_14;
  reg   id_15;
  module_0 modCall_1 (
      id_13,
      id_12,
      id_12,
      id_12,
      id_13,
      id_12,
      id_13
  );
  assign modCall_1.id_1 = 0;
  initial begin : LABEL_0
    begin : LABEL_0
      id_15 <= 1'b0;
      id_2  <= (id_14 == id_15);
    end
    if (1'b0 + 1'b0 - id_0) begin : LABEL_0
      id_1 <= 1'd0;
    end
    $display(id_10, 1);
    id_1 = id_5;
    id_14 <= id_4;
    #1;
    $display;
    id_14 <= 1;
  end
  for (id_16 = id_16; 1; id_7++) begin : LABEL_0
    logic id_17 = id_5;
    assign id_17 = id_0;
    if (id_14) begin : LABEL_0
      wire id_18;
    end else begin : LABEL_0
      assign id_16 = 1 + 1 || 1;
    end
    always @(posedge id_10 or posedge id_9 == id_6) id_16 <= 1;
  end
endmodule

// Seed: 2545961566
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  initial begin : LABEL_0
    id_3 = id_1 - 1'b0;
  end
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_8;
  always @(posedge id_3[1]) begin : LABEL_0
    id_2 <= 1;
  end
  wire id_9;
  always @(posedge 1 - 1 or negedge id_7)
    if (1) id_1 <= #1 1;
    else begin : LABEL_0
      if (1'b0) begin : LABEL_0
        id_1 <= 1;
      end else begin : LABEL_0
        id_1 <= 1;
      end
    end
  module_0 modCall_1 (
      id_4,
      id_9,
      id_8,
      id_9
  );
endmodule

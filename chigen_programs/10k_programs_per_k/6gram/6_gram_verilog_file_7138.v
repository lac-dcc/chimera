// Seed: 2730732
module module_0;
  wor id_1;
  wor id_2;
  generate
    if (1 && id_2 == "" && 1 && 1'b0) begin : LABEL_0
      wire id_3;
    end else begin : LABEL_0
      assign id_1 = id_2;
    end
  endgenerate
endmodule
program module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  generate
    for (id_8 = 1; 1; id_2 = 1) begin : LABEL_0
      initial begin : LABEL_0
        id_1 <= id_2;
        id_2 <= 1;
      end
      for (id_9 = 1; 1; id_2 = (1'd0) !=? id_2) begin : LABEL_0
        always @(posedge id_8) #1;
      end
    end
  endgenerate
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
endprogram

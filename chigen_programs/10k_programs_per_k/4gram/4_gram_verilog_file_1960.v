// Seed: 1746156010
module module_0 ();
  wor id_1, id_2;
  assign id_2 = id_2 ? 1'b0 : ~id_2 ? id_2 - id_2 : 1;
  assign id_2 = 1;
  assign module_1.id_6 = 0;
endmodule
module module_1 #(
    parameter id_4 = 32'd22
) (
    output wor   id_0,
    output wor   id_1,
    output logic id_2,
    output tri1  id_3,
    input  wand  _id_4
);
  bit id_6;
  always_latch @(posedge id_4) id_2 = 1'b0;
  assign id_1 = -1;
  module_0 modCall_1 ();
  always @(posedge 1) begin : LABEL_0
    if ("")
      case (id_4 && id_6)
        1'b0: begin : LABEL_1
          if (1) begin : LABEL_2
            id_6 = -1;
            id_2 <= {-1 + id_4};
          end
          id_6 <= -1;
        end
        default: id_6 = -1'h0;
      endcase
  end
  wire [1 : id_4] id_7;
  logic id_8;
  initial begin : LABEL_3
    if (1) id_6 <= (id_8);
  end
  wire id_9;
endmodule

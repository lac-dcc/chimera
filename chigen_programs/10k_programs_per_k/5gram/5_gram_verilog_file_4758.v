// Seed: 1802539680
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  output reg id_1;
  assign module_1.id_1 = 0;
  always @(posedge (id_2)) begin : LABEL_0
    if (1) begin : LABEL_1
      id_1 = #id_3 -1;
    end
  end
  wire id_4;
endmodule
module module_1 #(
    parameter id_1 = 32'd24,
    parameter id_4 = 32'd82
) (
    output logic id_0,
    input supply0 _id_1
    , id_6,
    input tri1 id_2,
    input supply1 id_3,
    input wor _id_4
);
  always_comb
    case (-1)
      1'b0:  id_6 = -1;
      -1'h0: id_6 <= -1'h0;
      1: begin : LABEL_0
        repeat (-1) begin : LABEL_1
          if (1 && 1 && 1 >> -1'b0) id_0 <= -1;
          else assume (-1'b0);
        end
      end
      id_1:  id_0 = -1;
    endcase
  wire [id_4 : id_1] id_7;
  parameter id_8 = 1;
  module_0 modCall_1 (
      id_6,
      id_8
  );
endmodule

// Seed: 3556633947
module module_0 ();
  wire id_1;
  assign id_1 = !id_1;
endmodule
module module_1 (
    output logic id_0,
    input  tri   id_1,
    input  wire  id_2,
    output logic id_3
);
  assign id_3 = 1'b0;
  logic id_5;
  always @(posedge "" or 1) begin : LABEL_0
    case (id_5)
      1: begin : LABEL_1
        wait (1'b0);
      end
      id_5: id_0 <= id_2;
      id_1: id_3 = id_5;
      id_5 >= -1: id_3 = 1;
      default: begin : LABEL_2
        id_0 <= -1'h0;
      end
    endcase
  end
  module_0 modCall_1 ();
endmodule

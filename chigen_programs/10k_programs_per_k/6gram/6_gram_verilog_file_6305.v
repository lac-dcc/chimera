// Seed: 3584854439
module module_0 ();
  id_1(
      id_2, (id_3), id_2
  );
  assign id_1 = -1;
  assign module_1.id_3 = 0;
  wire id_4;
  reg id_5, id_6;
  initial begin : LABEL_0
    id_5 <= id_5;
    id_3 = id_5;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_7 = id_1;
  always @(posedge id_4) begin : LABEL_0
    if (1)
      assume (1'b0);
      else begin : LABEL_0
        case (1'b0)
          id_2 < 1: id_6 = id_5;
          1: begin : LABEL_0
            id_2 <= 1'b0;
            id_3 <= 1;
          end
        endcase
      end
  end
  module_0 modCall_1 ();
endmodule

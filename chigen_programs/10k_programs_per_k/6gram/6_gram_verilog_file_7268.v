// Seed: 1233535702
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output uwire id_2;
  input wire id_1;
  generate
    case (id_1)
      -1:   logic [-1 : 1] id_4;
      id_1: integer [1 : 1] id_5;
    endcase
  endgenerate
  assign id_2 = 1;
endmodule
module module_1 #(
    parameter id_1 = 32'd44
) (
    _id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout logic [7:0] id_2;
  inout wire _id_1;
  wire id_4;
  always @(posedge 1'b0) begin : LABEL_0
    wait (id_4);
  end
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4
  );
  assign id_1 = id_3;
  assign id_2[id_1] = -1;
  logic [(  1  ) : 1] id_5;
  ;
  assign id_2[-1] = id_2;
  assign id_5[-1] = -1'h0;
  generate
    for (id_6 = 1; -1; id_6 = id_3) begin : LABEL_1
      wire id_7, id_8;
    end
  endgenerate
endmodule

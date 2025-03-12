// Seed: 1493573896
module module_0 #(
    parameter id_2 = 32'd93
) ();
  logic id_1;
  ;
  wire  _id_2;
  logic id_3;
  if (1) reg id_4;
  else
    initial begin : LABEL_0
      id_4 = 1'b0;
    end : SymbolIdentifier
endmodule
module module_1 (
    input  tri   id_0,
    output logic id_1,
    output logic id_2,
    input  uwire id_3,
    output tri1  id_4,
    output logic id_5,
    output tri0  id_6
);
  assign id_1 = -1;
  buf primCall (id_1, id_3);
  module_0 modCall_1 ();
  assign modCall_1.id_4 = 0;
  always_comb $clog2(27);
  ;
  always_ff begin : LABEL_0
    id_2 <= 1;
    begin : LABEL_1
      id_5 = id_3;
      @(id_0) begin : LABEL_2
        id_2 = id_0#(.id_0(1));
      end
    end
    @((id_3)) $signed(59);
    ;
    id_1 <= -1;
  end
  logic id_8, id_9;
endmodule

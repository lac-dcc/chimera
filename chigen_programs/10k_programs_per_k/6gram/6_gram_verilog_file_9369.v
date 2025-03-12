// Seed: 1810681774
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  inout logic [7:0] id_1;
  assign id_1[1] = id_1;
  always
    if ((1)) begin : LABEL_0
      if (1) begin : LABEL_1
        deassign id_2;
      end else begin : LABEL_2
        $signed(88);
        ;
      end
    end
endmodule
module module_1 #(
    parameter id_6 = 32'd35
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6
);
  output wire _id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output reg id_2;
  inout wire id_1;
  localparam id_7 = 1;
  logic id_8 = -1;
  logic [id_6 : -1 'b0] id_9;
  module_0 modCall_1 (
      id_9,
      id_7
  );
  assign id_2 = 1;
  always begin : LABEL_0
    id_2 = -1 < id_5;
    id_9[-1'b0] <= id_4#(
        .id_7(1'b0),
        .id_8(-1 << (-1 == 1'd0))
    );
  end
endmodule

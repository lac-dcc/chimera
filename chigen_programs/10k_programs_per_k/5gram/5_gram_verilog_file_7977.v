// Seed: 1463444358
module module_0;
  always_latch @(1 or posedge 1 && 1 * 1 - id_1) begin : LABEL_0
    if (id_1) assume (1);
    #1 begin : LABEL_0
      id_1 <= 1'b0;
    end
    fork
      begin : LABEL_0
        if ((id_1)) begin : LABEL_0
          assert (1);
        end
        if (1) begin : LABEL_0
          disable id_2;
        end
      end
    join_none
  end
  final $display(id_1, id_1, (0 >= 1) == (id_1), 1 == id_1, 1 == 1 < 1'd0, id_1, id_1, 1);
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_5;
  wire id_6;
  module_0 modCall_1 ();
  wire id_7;
  wire id_8;
endmodule

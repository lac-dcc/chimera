// Seed: 2993171307
module module_0;
  assign id_1[1] = 1'b0;
  wire id_2;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  assign id_1 = 1 ? 1 : 1;
  reg id_3;
  module_0 modCall_1 ();
  initial begin : LABEL_0
    begin : LABEL_0
      case (id_2)
        id_1: id_1 = 1'h0;
        default: id_1 <= id_2;
      endcase
    end
    if (id_2) begin : LABEL_0
      id_1 = #id_4 1;
      id_4 <= 1;
      #1;
      id_3 <= (id_4);
      id_3 = id_4;
      $display(id_1, 1'd0, id_3, id_3.id_3, id_4, id_2);
    end
  end
endmodule

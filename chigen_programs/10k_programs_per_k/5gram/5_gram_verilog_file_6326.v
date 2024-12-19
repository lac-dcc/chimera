// Seed: 1963167669
module module_0 ();
  assign id_1 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  reg id_6;
  initial
    forever begin : LABEL_0
      id_4 <= {1'b0, id_1, 1'b0};
      case (
      id_6++
      )
        1: begin : LABEL_0
          id_6 = id_3;
        end
        1 == 1: id_3 = 1;
        $display: id_1 <= 1;
        1: id_2 = id_3;
        id_1: id_6 = {id_2, 1};
        1 == id_1: begin : LABEL_0
          @(posedge id_5);
          id_3 <= id_6;
        end
        default: id_3 = 1;
      endcase
    end
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  wire id_7;
endmodule

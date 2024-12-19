// Seed: 944124262
module module_0 ();
  timeunit 1ps;
  always @(posedge id_1)
    if (1'd0)
      #1 begin : LABEL_0
        id_1 = #1  (1 == &id_1) == 1;
      end
    else begin : LABEL_0
      case (1)
        1: id_1 <= 1;
        1: id_1 = 1;
        id_1: ;
      endcase
    end
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_1 = 1 > id_4;
  uwire id_7;
  module_0 modCall_1 ();
  reg id_8, id_9, id_10, id_11;
  assign id_7 = 1;
  wire id_12;
  generate
    genvar id_13;
    for (id_14 = 1 - ""; id_7 >> id_9; id_14 = 1) begin : LABEL_0
      always @(posedge id_9) begin : LABEL_0
        id_8 = #id_15 1 == id_8;
      end
    end
  endgenerate
endmodule

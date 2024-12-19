// Seed: 136654768
module module_0;
  assign id_1 = id_1;
  wire id_2;
  assign module_1.type_0 = 0;
  wire id_3;
endmodule
module module_1 (
    input supply0 id_0,
    output logic id_1,
    input logic id_2,
    output logic id_3,
    input logic id_4,
    input tri1 id_5,
    output uwire id_6
);
  logic id_8;
  assign id_8 = id_2;
  logic id_9;
  wire  id_10;
  logic id_11, id_12;
  module_0 modCall_1 ();
  always @(posedge id_12 & 1 == 1) begin : LABEL_0
    assume #1  (1)
    else $display(1, 1, 1, id_4, id_2);
    #1 id_11 = id_9;
    id_3 = 1'd0;
    id_1 = (id_4 && 1) - id_12;
    #1 $display;
    id_1 <= 1;
    #1;
    id_3 <= 1;
    $display(id_9, id_12);
    id_3 = id_9;
    case (id_11)
      1: id_11 = id_2;
      default: begin : LABEL_0
        if (id_2) id_12 <= 1;
      end
    endcase
    assume (id_4);
    id_12 <= id_8 - 1;
    $display(id_10);
    id_11 = #id_13 1'b0;
  end
  nand primCall (id_1, id_10, id_11, id_12, id_2, id_4, id_5, id_8, id_9);
endmodule

// Seed: 2067939750
module module_0;
  wand id_1;
  assign module_1.id_12 = 0;
  tri1 id_2, id_3 = 1, id_4, id_5, id_6, id_7, id_8;
  wire id_9;
  always @(posedge 1) begin : LABEL_0$display
    ;
  end
  initial $display(id_7, id_1);
endmodule
module module_1 (
    input logic id_0,
    output wand id_1,
    input supply0 id_2,
    input tri1 id_3,
    input tri id_4,
    input wor id_5,
    output uwire id_6,
    output supply0 id_7
);
  assign id_6 = 1 > id_0;
  logic
      id_9,
      id_10,
      id_11,
      id_12,
      id_13,
      id_14,
      id_15,
      id_16,
      id_17,
      id_18,
      id_19,
      id_20,
      id_21,
      id_22,
      id_23,
      id_24,
      id_25,
      id_26,
      id_27,
      id_28,
      id_29,
      id_30,
      id_31,
      id_32,
      id_33,
      id_34,
      id_35,
      id_36,
      id_37,
      id_38,
      id_39 = 1;
  always @(posedge 1'h0 or negedge 1) begin : LABEL_0
    if (id_15)
      casez (id_0)
        1: id_15 = 1'h0;
        1'b0: begin : LABEL_0
          if (id_16) id_11 <= 1;
          else id_37 = (id_11);
        end
        id_36: id_22 <= 1 == id_2;
        default:
        #1 begin : LABEL_0
          id_25 <= id_9;
        end
      endcase
  end
  always #(1) id_10 <= id_9;
  module_0 modCall_1 ();
endmodule

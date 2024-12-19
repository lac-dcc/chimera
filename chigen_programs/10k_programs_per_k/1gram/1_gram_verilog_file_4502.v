// Seed: 143796187
module module_0 ();
  wire id_1;
  always_ff $display(id_1);
  wire id_2;
endmodule
module module_1;
  assign id_1 = 1;
  always @(posedge id_1) id_1 = id_1;
  wire id_4;
  tri id_5, id_6, id_7;
  wire id_8;
  module_0 modCall_1 ();
  always_latch
    if (1);
    else
      #id_9
        case (1'b0)
          1 !== id_3 <-> id_3: begin : LABEL_0
            @(posedge 1'h0) id_1.id_1 <= id_1;
          end
        endcase
  wire id_10;
  always id_7 = 1;
  wire id_11, id_12, id_13;
endmodule

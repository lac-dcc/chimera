// Seed: 3172360534
module module_0 ();
  bit id_1;
  bit id_2, id_3, id_4;
  initial begin : LABEL_0
    $unsigned(4);
    ;
  end
  generate
    always @(posedge id_1 or posedge -1) begin : LABEL_1
      id_4 <= id_4;
      if (1) begin : LABEL_2
        id_1 <= id_4;
        if (1 < 1) begin : LABEL_3
          id_2 <= -1 * 'h0 * {id_4, id_4};
        end else begin : LABEL_4
          assume #1  (id_3) $unsigned(18);
          ;
        end
      end else id_2 <= id_1;
    end
  endgenerate
  always @(id_2 or(1)) begin : LABEL_5
    begin : LABEL_6
      id_2 <= 1;
    end
  end
  wire id_5;
  assign id_3 = 1'b0;
  wire id_6;
endmodule
module module_1 ();
  wire id_1;
  module_0 modCall_1 ();
endmodule

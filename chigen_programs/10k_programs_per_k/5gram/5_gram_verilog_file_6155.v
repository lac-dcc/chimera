// Seed: 3469186802
module module_0;
  assign id_1 = 1;
  assign module_1.id_0 = 0;
  wire id_2;
  assign id_1 = 1;
  wire id_3;
  wire id_4;
endmodule
module module_1 (
    input supply1 id_0,
    input logic   id_1
);
  reg id_3;
  always @(negedge 1'h0 or posedge id_1) begin : LABEL_0
    if (id_0 == id_0)
      for (id_3 = id_3; 1'd0 == id_3; id_3 = 1) begin : LABEL_0
        id_3 <= id_1;
      end
    else begin : LABEL_0
      if (id_3) begin : LABEL_0
        id_3 <= id_1;
        id_3 <= ~id_0;
      end else begin : LABEL_0
        wait (id_1 - 1'b0);
      end
    end
  end
  module_0 modCall_1 ();
endmodule

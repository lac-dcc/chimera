// Seed: 3698537462
module module_0;
  always @(posedge 1) begin : LABEL_0
    {id_1 > 1, 1} += 1'd0;
    #1;
    #id_1;
    $display(1);
    assign id_1 = 1'd0;
    wait (id_1);
  end
  always begin : LABEL_0
    if (1)
      if (1 && (1)) id_2 = 1 == 1;
      else if (1 == 1'h0) begin : LABEL_0
        if (id_2 || 1'b0 || 1 + 1 || -id_2) begin : LABEL_0
          deassign id_2;
        end else if (id_2) begin : LABEL_0
          id_2 <= id_2;
        end
      end else begin : LABEL_0
        id_2 = 1;
      end
  end
  assign id_3 = 1;
  initial
  fork
  join
  assign module_1.id_1 = 0;
endmodule
module module_1;
  module_0 modCall_1 ();
endmodule

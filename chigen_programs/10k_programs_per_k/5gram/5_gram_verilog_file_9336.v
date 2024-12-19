// Seed: 3355765907
module module_0 ();
  assign id_1 = 1'h0;
endmodule
module module_1 (
    output supply0 id_0,
    output wor id_1,
    input tri1 id_2,
    input tri0 id_3,
    input tri1 module_1,
    input supply0 id_5,
    inout logic id_6,
    output logic id_7,
    output logic id_8,
    input wor id_9,
    input logic id_10,
    output tri1 id_11
);
  logic id_13 = 1, id_14;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  assign id_1 = 1'b0;
  nor primCall (id_0, id_10, id_13, id_14, id_2, id_3, id_5, id_6, id_9);
  always_comb @(negedge id_5 == 1 or posedge id_13) begin : LABEL_0
    if (id_9)
      if (id_3) id_8 <= 1 == id_5;
      else begin : LABEL_0
        id_13 = id_6;
        if (1'd0) id_7 = 1;
        else $display;
      end
    else begin : LABEL_0
      fork
        id_15;
        #1 id_14 <= id_10;
      join
      $display(id_15, 1'b0, id_14, id_6 * 1, id_9 == 1, id_14, 1'b0);
      id_7 <= #1 1;
    end
  end
endmodule

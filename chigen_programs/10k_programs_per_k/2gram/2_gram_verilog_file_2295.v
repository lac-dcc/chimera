// Seed: 3359660275
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  logic [7:0] id_3;
  always_ff @(negedge 1 & 1 & 1 or posedge 1) begin : LABEL_0
    @(negedge id_3[1]);
    $display(1, 1'h0);
    disable id_4;
  end
  assign id_1 = 1;
  assign module_1.type_9 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  reg id_5;
  module_0 modCall_1 (
      id_1,
      id_2
  );
  reg id_6;
  always begin : LABEL_0
    id_5 <= id_2 !=? id_4;
    id_3 <= ~id_5;
    $display;
    if (id_5)
      if (id_4) id_6 <= 1;
      else begin : LABEL_0
        id_6 = #1 1;
      end
  end
endmodule

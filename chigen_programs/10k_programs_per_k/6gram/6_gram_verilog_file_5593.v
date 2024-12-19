// Seed: 2581459422
module module_0;
  assign id_1 = 1;
  assign module_2.type_0 = 0;
  assign module_1.id_1 = 0;
endmodule
module module_1;
  initial begin : LABEL_0
    id_1 = 1'd0;
    repeat (id_1 < id_1) begin : LABEL_0
      if ((id_1)) begin : LABEL_0
        id_1 = 1'b0 < id_1;
        id_1 <= 1;
        $display;
      end
    end
  end
  module_0 modCall_1 ();
endmodule
module module_2 (
    input  logic id_0,
    output wand  id_1,
    output wor   id_2,
    output logic id_3
);
  module_0 modCall_1 ();
  assign id_3 = 1;
  always @(id_0 or posedge ~id_0 ^ id_0) id_3 = #1 id_0;
endmodule

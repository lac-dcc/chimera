// Seed: 1711949413
module module_0 (
    input wand id_0,
    input tri0 id_1,
    input wor  id_2
);
  supply0 id_4 = 1'd0;
endmodule
module module_1 (
    input  wor   id_0,
    output tri   id_1,
    input  logic id_2,
    output logic id_3
);
  id_5 :
  assert property (@(id_5) id_5) id_3 <= 1'b0;
  assign id_3 = 1;
  initial begin : LABEL_0
    id_1 = 1'b0;
    begin : LABEL_0
      begin : LABEL_0
        @(posedge 1) id_5 <= 1'b0;
      end
    end
    id_3 <= id_2;
  end
  wire id_6;
  wire id_7;
  assign id_5 = 1;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0
  );
  assign modCall_1.type_5 = 0;
  wire id_8;
  always_latch @('h0 - 1) $display(id_2, 1'b0 !=? 1);
  wire id_9;
endmodule

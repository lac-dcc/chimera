// Seed: 12526760
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_3 = 1;
  wire id_4;
  always_latch @(posedge 1) begin : LABEL_0
    assume (id_2);
  end
  assign id_3 = id_2;
  assign id_1 = 1;
  assign id_1 = 1;
  wire id_5;
  wire id_6;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  always @(posedge 1'b0 or negedge 1 - 1'b0) begin : LABEL_0
    #(id_1);
    if (1'b0) begin : LABEL_0
      id_3 <= id_1;
    end else begin : LABEL_0
      id_3#(1, $display(id_2, id_2, id_2, {id_1, id_2} - 1, id_1 + 1, 1)) <= id_1;
      id_3 <= 1'b0;
    end
  end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2
  );
endmodule

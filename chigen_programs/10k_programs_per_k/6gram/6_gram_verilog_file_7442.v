// Seed: 1721465752
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  reg id_5;
  assign module_1.id_3 = 0;
  initial begin : LABEL_0
    id_5 <= 1'd0;
    $display(1);
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  reg id_6;
  assign id_1 = id_4;
  always @(posedge id_4 == id_2) begin : LABEL_0
    #1 id_6 = 1;
    id_1 = id_3 == id_6;
    id_6 <= id_2;
  end
  module_0 modCall_1 (
      id_5,
      id_5,
      id_3,
      id_5
  );
  assign id_5 = 1'b0;
  always @(posedge id_6 or negedge id_4) begin : LABEL_0$display
    ;
  end
  always @(posedge 1) begin : LABEL_0
    id_1 <= 1'd0;
  end
endmodule

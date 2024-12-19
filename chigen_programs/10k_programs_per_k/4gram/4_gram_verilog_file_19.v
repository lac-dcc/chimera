// Seed: 1588962757
module module_0 (
    input  logic id_0,
    output logic id_1
);
  initial begin : LABEL_0
    id_1 <= id_0 * 1;
    id_1 = id_0;
    #1 begin : LABEL_0
      id_1 = !id_0 & 1'b0;
    end
    if (1 - 1 ==? 1) id_1 <= 1;
  end
  tri1 id_3 = 1;
  assign id_3 = 1;
  wire id_4;
  assign id_3 = id_3 | id_3;
  wire id_5;
endmodule
module module_1 (
    output logic id_0,
    output tri0  id_1,
    output tri1  id_2,
    input  logic id_3
);
  always @(negedge id_3) begin : LABEL_0
    id_0 <= (1);
    if (1) assign id_1 = id_3;
  end
  buf primCall (id_2, id_3);
  module_0 modCall_1 (
      id_3,
      id_0
  );
  assign modCall_1.id_1 = 0;
endmodule

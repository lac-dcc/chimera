// Seed: 347080879
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = id_3;
  always @(id_3)
    if (1)
      for (id_2 = 1'h0; 1; id_1++)
        if (id_3) id_2 <= 1;
        else id_3 <= id_3 > (id_2);
endmodule
module module_1 (
    output logic id_0,
    input  logic id_1,
    input  logic id_2
);
  assign id_0 = id_1;
  supply1 id_4;
  wire id_5;
  always @(id_2 or posedge 1'b0) begin : LABEL_0
    id_0 <= id_2;
  end
  assign id_5 = 1;
  reg id_6;
  initial #1 $display;
  always @(posedge id_4 - id_1) begin : LABEL_0
    id_0 <= id_6;
  end
  module_0 modCall_1 (
      id_4,
      id_6,
      id_6
  );
  assign modCall_1.id_1 = 0;
endmodule

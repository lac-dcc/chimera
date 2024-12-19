// Seed: 2752753936
module module_0 (
    output tri0 id_0,
    input tri0 id_1,
    input tri id_2,
    output tri0 id_3,
    output tri id_4,
    output tri0 id_5,
    output supply0 id_6
);
  always @(posedge 1 or id_2) #1;
  wire id_8;
  assign module_1.type_5 = 0;
  tri0 id_9 = id_1;
endmodule
module module_1 (
    output supply1 id_0,
    output supply1 id_1,
    output supply1 id_2,
    output logic id_3,
    input wire id_4,
    input logic id_5,
    output wire id_6
);
  assign id_3 = id_5;
  module_0 modCall_1 (
      id_0,
      id_4,
      id_4,
      id_2,
      id_6,
      id_0,
      id_1
  );
  always @(posedge id_4) begin : LABEL_0
    if (1'h0 & id_5) id_3 <= #1 1'b0;
  end
  always @(posedge 1) begin : LABEL_0
    if (id_5 * id_4 << 1) begin : LABEL_0
      id_3 = 1'h0;
    end
  end
endmodule

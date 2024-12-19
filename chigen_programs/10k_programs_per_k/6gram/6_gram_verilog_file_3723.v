// Seed: 802203633
module module_0 (
    input  logic id_0,
    output logic id_1,
    input  tri0  id_2
);
  always @(posedge 1'b0) begin : LABEL_0
    id_1 <= id_0;
  end
endmodule
module module_1 (
    input logic id_0
    , id_7,
    input tri1 id_1,
    input supply0 id_2,
    input tri1 id_3,
    input wor id_4,
    output logic id_5
);
  reg id_8;
  reg id_9;
  assign id_7 = id_8;
  assign id_9 = 1;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_1
  );
  assign modCall_1.id_1 = 0;
  always repeat (id_0) id_5 = #1 id_7;
  always @(id_7 or id_7) begin : LABEL_0
    id_9 <= id_0;
    id_8 <= !id_8 == 1;
  end
endmodule

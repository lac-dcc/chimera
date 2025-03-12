// Seed: 2651408871
module module_0 (
    input  tri0  id_0,
    output logic id_1
);
  always @(-1 ** id_0 or posedge id_0) begin : LABEL_0
    id_1 <= 1'b0;
  end
  assign id_1 = 1'b0;
  assign id_1 = ~id_0;
endmodule
module module_1 (
    input  wire  id_0,
    input  wire  id_1,
    output logic id_2
);
  wire id_4;
  module_0 modCall_1 (
      id_1,
      id_2
  );
  reg id_5;
  ;
  always begin : LABEL_0
    id_2 = id_4;
    id_5 <= id_0;
    id_5 <= (1'b0 + 1);
    id_2 = id_0;
  end
endmodule

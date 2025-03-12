// Seed: 1536498331
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_3 = id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout reg id_2;
  input wire id_1;
  wire id_4;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_4
  );
  wire id_5;
  tri1 id_6 = 1;
  always @(posedge -1'b0 or posedge 1) begin : LABEL_0
    if (1) begin : LABEL_1
      if (1) begin : LABEL_2
        id_2 = 1'h0 && 1;
      end
    end
    assign id_4 = 1;
    assert (-1 == id_2 || -1);
  end
endmodule

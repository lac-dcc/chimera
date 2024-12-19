// Seed: 1016549617
module module_0 ();
  tri0 id_1;
  wire id_2;
  assign id_1 = (1);
  wire id_4 = id_2;
  wire id_7, id_8, id_9;
  wire id_10;
  wire id_11, id_12, id_13, id_14, id_15, id_16, id_17, id_18, id_19, id_20;
endmodule
module module_1 (
    input logic id_0,
    input logic id_1
);
  logic id_3 = id_0;
  always @(posedge 1 or {id_0{"" < id_1}}) begin : LABEL_0
    if (1 || id_3 || id_3) id_3 <= 1 - id_0;
    else begin : LABEL_0
      id_3 <= "";
    end
  end
  module_0 modCall_1 ();
  always_ff @(posedge id_1 or posedge 1) begin : LABEL_0
    id_3 <= 1;
  end
endmodule

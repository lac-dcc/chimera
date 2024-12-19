// Seed: 1563870508
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_3 = id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  tri1 id_8 = 1;
  module_0 modCall_1 (
      id_3,
      id_7,
      id_8,
      id_8,
      id_1,
      id_8
  );
  always @(negedge 1 == id_2) begin : LABEL_0
    if (id_5) begin : LABEL_0
      if (1 || 1) begin : LABEL_0
        if (id_2) $display("");
      end else begin : LABEL_0
        assert (id_6);
      end
    end
  end
endmodule

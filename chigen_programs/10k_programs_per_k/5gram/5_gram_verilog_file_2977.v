// Seed: 1449906652
module module_0;
  generate
    if ('h0 == (id_1)) begin : LABEL_0
      wire id_3;
    end else begin : LABEL_0
      wire id_4;
    end
  endgenerate
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  always @(posedge 1 or posedge id_2) begin : LABEL_0
    repeat ({
      id_3, id_3, (1), 1, id_1, ""
    }) begin : LABEL_0
      id_3 <= id_2;
    end
  end
  assign id_3 = 1;
  module_0 modCall_1 ();
  wire id_5;
endmodule

// Seed: 2769831101
module module_0;
  assign id_1 = 1;
  assign module_2.id_4 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wor id_5;
  module_0 modCall_1 ();
  assign id_5 = 1'b0;
endmodule
module module_0 (
    id_1,
    module_2,
    id_2
);
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  generate
    for (id_4 = 1; 1; id_3 = ~id_3 - id_3) begin : LABEL_0
      assign id_3 = id_3;
      always @(negedge 1'd0) begin : LABEL_0
        assert (id_1);
      end
    end
  endgenerate
  and primCall (id_1, id_2, id_3, id_4);
  module_0 modCall_1 ();
endmodule

// Seed: 24743973
module module_0;
  wire id_2;
  assign module_1.id_1 = 0;
endmodule
module module_1 #(
    parameter id_3 = 32'd40,
    parameter id_4 = 32'd26
);
  final begin : LABEL_0
    id_1 = 1 | 1 | id_1;
  end
  module_0 modCall_1 ();
  wire id_2;
  defparam id_3.id_4 = 1'b0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(posedge id_2 or id_3)
    assert (id_3) begin : LABEL_0
      #1;
    end
  module_0 modCall_1 ();
endmodule

// Seed: 659421521
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_6;
endmodule
module module_1 #(
    parameter id_3 = 32'd71
) (
    id_1,
    id_2,
    _id_3[1 : id_3],
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  inout logic [7:0] _id_3;
  input wire id_2;
  output reg id_1;
  wire id_6;
  assign id_1 = -1;
  assign id_6 = id_5;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_6,
      id_5,
      id_5
  );
  always_comb
    if (1) begin : LABEL_0
      begin : LABEL_1
        @(posedge id_5) id_1 <= 1;
        @* id_1 = id_3#(.product(1));
      end
    end
endmodule

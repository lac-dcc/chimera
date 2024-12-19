// Seed: 3681739367
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign #id_9 id_2 = 1'b0;
  uwire id_10 = 1;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  always_comb @(negedge 1 or posedge 1)
    if (id_1) begin : LABEL_0
      #1 id_1 = #id_3 1;
      id_1 = 1'b0;
      id_3 <= 1;
    end
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
endmodule

// Seed: 1313848533
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  output wire id_1;
  logic id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  xnor primCall (id_3, id_1, id_4, id_2, id_6, id_5);
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_3
  );
  inout wand id_2;
  inout logic [7:0] id_1;
  assign id_2 = 1;
  always @(posedge id_2) begin : LABEL_0
    id_1[-1'h0] <= id_6;
  end
  wire id_7;
endmodule

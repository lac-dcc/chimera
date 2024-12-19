// Seed: 1421213835
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_2 = 1;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2
  );
  always @(posedge ((id_2 && 1)) or posedge 1'd0) begin : LABEL_0
    id_1 = #id_4 1'd0;
  end
  assign id_2 = id_2;
endmodule

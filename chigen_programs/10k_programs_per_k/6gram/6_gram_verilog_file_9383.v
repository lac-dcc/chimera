// Seed: 3122735458
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_5 = 1;
  wire id_7;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  wand id_3;
  generate
    if (1'b0 && 1) begin : LABEL_0
      genvar id_4;
      assign id_4 = id_1;
      assign id_3 = id_1 ? 1 : 1'h0;
      wire id_5;
    end
  endgenerate
  always @(posedge 1) release id_3;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_4
  );
endmodule

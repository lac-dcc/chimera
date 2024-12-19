// Seed: 1908581188
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_1 = 1;
  wire id_5;
  assign module_1.id_2 = 0;
  wire id_6;
  wand id_7 = 1'b0;
  wire id_8;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  always @(posedge 1) begin : LABEL_0
    if (id_2) #1 force id_2 = 1;
  end
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2
  );
endmodule

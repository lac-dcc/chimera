// Seed: 236926584
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  assign id_1 = id_2;
endmodule
module module_1 (
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
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  generate
    for (id_9 = 1'b0; 1; id_2 = id_2) begin : LABEL_0
      wire id_10 = id_4;
    end
  endgenerate
  module_0 modCall_1 (
      id_2,
      id_6
  );
endmodule

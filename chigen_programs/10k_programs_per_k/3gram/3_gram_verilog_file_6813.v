// Seed: 504776844
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
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
  module_0 modCall_1 (
      id_4,
      id_1,
      id_4,
      id_2
  );
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_4 = 1;
  generate
    for (id_7 = -1; (id_4); id_7 = id_2) begin : LABEL_0
      wire id_8;
    end
  endgenerate
  logic id_9;
  ;
  logic [1 : -1] id_10 = id_4;
endmodule

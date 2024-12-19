// Seed: 3656746166
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_4 = id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  supply0 id_5, id_6 = id_4;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_4
  );
  assign id_6 = id_5;
  always_latch @(posedge 1) begin : LABEL_0
    id_1[1 : 1] = 1 ? id_6 : id_6;
    #1;
    id_6 = 1;
  end
  wire id_7;
endmodule

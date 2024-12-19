// Seed: 4251725262
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  reg id_10;
  always_comb
    repeat (id_5) begin : LABEL_0
      id_10 <= 1;
    end
  assign id_9 = 1'h0;
endmodule
module module_1 (
    output tri0 id_0
    , id_2
);
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_3,
      id_3,
      id_3
  );
  assign modCall_1.type_11 = 0;
endmodule

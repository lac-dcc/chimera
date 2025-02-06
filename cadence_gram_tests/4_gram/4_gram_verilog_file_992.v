// Seed: 1107510128
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  always @(negedge id_4) begin : LABEL_0
    id_4 = 1;
  end
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4
  );
  id_6(
      .id_0(-1), .id_1(1), .id_2($realtime), .id_3(1'h0), .id_4(1)
  );
  assign id_5 = 1;
  wor  id_7 = id_4;
  wire id_8;
  assign id_4 = ($realtime);
endmodule

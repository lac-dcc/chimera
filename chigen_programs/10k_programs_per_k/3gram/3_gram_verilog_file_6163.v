// Seed: 3492998689
program module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_5;
  wire id_6;
  wire id_7;
  wire id_8, id_9;
  supply0 id_10 = 1'd0;
  id_11(
      .id_0(1), .id_1(id_2 / id_9)
  );
  wire id_12, id_13, id_14, id_15, id_16, id_17, id_18, id_19;
  always @(posedge 1 or posedge id_10);
  wire id_20;
  wire id_21;
endprogram
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2
  );
  assign modCall_1.id_2 = 0;
  wire id_3;
endmodule

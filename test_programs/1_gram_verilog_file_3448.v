// Seed: 2208621449
module module_0 ();
  tri id_1, id_3, id_4;
  wire id_5;
  wire id_6, id_7;
  assign id_3 = 1;
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
  always begin : LABEL_0
    @(1, id_4) id_4 <= id_4 ? id_4 : -1'b0;
    force id_2 = -1;
  end
  always if (id_4) id_1 <= -1'b0;
  buf primCall (id_1, id_4);
  module_0 modCall_1 ();
endmodule

// Seed: 3608225532
module module_0 (
    id_1
);
  output wire id_1;
  wire id_2;
  assign module_2.id_1 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  always
    if (1) id_1 = 1;
    else if (id_1) id_1 <= 1;
    else begin : LABEL_0
      @(posedge id_2) id_1 = id_3;
    end
  initial release id_2;
  module_0 modCall_1 (id_4);
endmodule
module module_2;
  always id_1 = ~1;
  module_0 modCall_1 (id_1);
  assign id_1 = 1;
  wor id_2 = 1;
endmodule

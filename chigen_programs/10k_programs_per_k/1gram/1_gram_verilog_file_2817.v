// Seed: 551503763
module module_0 ();
  always begin : LABEL_0
    if (1) id_1 <= 1;
    else id_1 = id_1;
    #1 if (id_1) id_1 <= id_1;
  end
  assign module_1.id_1 = 0;
  always id_2 <= #1 1'h0;
  wire id_3;
  wire id_4;
  wire id_5, id_6;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  assign id_1 = 1;
  module_0 modCall_1 ();
  always id_1 <= 1;
  assign id_1 = id_2 + 1 - id_1;
  wire id_3;
endmodule

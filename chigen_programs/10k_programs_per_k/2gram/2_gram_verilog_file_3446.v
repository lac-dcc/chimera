// Seed: 2279422192
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_2 = ~id_1;
  wire id_4;
  assign module_1.id_2 = 0;
  wire id_5;
  wire id_6;
  wire id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  uwire id_5;
  assign id_1 = 1;
  buf primCall (id_3, id_2);
  always begin : LABEL_0
    id_1 = 1'h0;
    id_4 <= id_2 < 1;
  end
  assign id_5 = 1;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5
  );
endmodule

// Seed: 2402866558
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  always @(1 or id_3) begin : LABEL_0
    disable id_6;
  end
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_2,
      id_1,
      id_3
  );
  always @(1) id_1 = 1;
  or primCall (id_3, id_1, id_6, id_5);
  wire id_7;
  tri0 id_8 = 1;
endmodule

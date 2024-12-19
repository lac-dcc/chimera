// Seed: 2336800070
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  pmos (
      id_3,
      {1 - id_5, id_1},
      (1 ? ~id_1 : 1 ? id_4 : 1'b0 ? id_4 : id_6 ? 1'b0 == 1 : 1 ? 1 : id_4 ? id_4#(1, 1'b0) : 1),
      id_2
  );
endmodule
module module_1 (
    input  tri1 id_0,
    output tri0 id_1
);
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
  assign modCall_1.id_3 = 0;
  wire id_4;
  assign id_1 = 1'h0 !== 1 ? 1 : 1;
endmodule

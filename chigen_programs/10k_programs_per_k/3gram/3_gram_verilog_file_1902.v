// Seed: 3898229064
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  tri0 id_5 = 1;
endmodule
module module_1;
  assign id_1 = 1;
  wire id_2;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  always @(posedge 1'b0 or posedge ~id_1) disable id_5;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_5,
      id_5
  );
endmodule

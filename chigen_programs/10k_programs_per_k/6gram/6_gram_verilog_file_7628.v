// Seed: 952234666
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(1 ^ id_4 - id_5 or posedge "") begin : LABEL_0
    release id_1;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  initial begin : LABEL_0
    id_3 = #id_5 id_1 == 1'd0;
    $display;
  end
  tri1 id_6 = 1;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_1,
      id_2,
      id_1,
      id_6,
      id_4
  );
  wire id_7;
endmodule

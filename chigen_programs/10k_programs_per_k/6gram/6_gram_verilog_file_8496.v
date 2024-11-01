// Seed: 3081055395
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_1 = 1'b0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_5;
  wire id_6;
  module_0(
      id_3, id_1, id_3, id_6
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_5;
  wire id_6;
  module_0(
      id_4, id_1, id_3, id_4
  );
  wire id_7;
  generate
    if (id_4) always #1 force id_7 = 1;
    else assign id_2[1] = 1 != id_6 ? id_3 - id_3 : 1;
  endgenerate
endmodule

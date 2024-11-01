// Seed: 2299706644
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  input wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_6 = 1'h0;
  nand (id_6, id_1, id_3, id_10, id_7, id_4);
  module_0(
      id_2, id_7, id_7, id_9, id_5, id_7
  );
  supply0 id_11 = $display(1'b0) - id_10;
  assign id_7 = id_4;
endmodule

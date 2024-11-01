// Seed: 1539250023
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  inout wire id_15;
  input wire id_14;
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_16;
  wire id_17;
  always #1;
  supply0 id_18;
  assign id_3 = 1 ? 1 : {id_18{id_18 - 1'h0}};
  wire id_19 = 1;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    module_1,
    id_5
);
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_7;
  or (id_4, id_5, id_1, id_7);
  module_0(
      id_4, id_1, id_3, id_4, id_1, id_4, id_5, id_5, id_4, id_7, id_7, id_2, id_2, id_4, id_4
  );
endmodule

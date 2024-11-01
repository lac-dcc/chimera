// Seed: 1533613166
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
    id_15,
    id_16
);
  input wire id_16;
  inout wire id_15;
  output wire id_14;
  output wire id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_17;
  wire id_18;
  assign id_18 = id_1;
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
  inout wire id_2;
  inout wire id_1;
  always @(posedge 1 or id_1++
  )
  begin
    id_1 = id_2;
  end
  nand (id_5, id_1, id_2, id_3, id_4);
  module_0(
      id_1, id_3, id_5, id_5, id_1, id_2, id_1, id_5, id_4, id_5, id_3, id_2, id_5, id_1, id_1, id_5
  );
endmodule

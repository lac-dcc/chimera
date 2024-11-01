// Seed: 1601631124
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
    id_14
);
  inout wire id_14;
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  supply0 id_15;
  wire id_16;
  wire id_17;
  always_latch #1;
  assign id_11 = id_15;
  assign id_11 = 1;
  rnmos (id_2, 1'b0 + id_15, 1'b0, 1 - id_6 + id_15, id_8);
  always begin
    id_5 = id_12;
    #0 return 1;
  end
endmodule
module module_1;
  wire id_1, id_2, id_3, id_4;
  module_0(
      id_3, id_3, id_4, id_3, id_3, id_4, id_3, id_2, id_3, id_1, id_2, id_2, id_2, id_4
  );
endmodule

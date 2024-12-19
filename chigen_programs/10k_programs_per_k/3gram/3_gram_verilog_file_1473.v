// Seed: 181701543
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_10;
endmodule
macromodule module_1 (
    output tri id_0,
    output supply0 id_1,
    input tri0 id_2,
    input supply1 id_3,
    input tri1 id_4
    , id_15,
    input supply0 id_5,
    input wor id_6
    , id_16,
    output tri1 id_7,
    input tri1 id_8,
    output supply1 id_9,
    input uwire id_10,
    input tri1 id_11,
    output supply1 id_12,
    output tri1 id_13
);
  wire id_17;
  wire id_18;
  module_0 modCall_1 (
      id_16,
      id_17,
      id_18,
      id_15,
      id_16,
      id_17,
      id_18,
      id_18,
      id_17
  );
  assign id_16 = id_18;
  id_19 :
  assert property (@(negedge ~1 - 1'b0) 1)
  else assert (1);
endmodule

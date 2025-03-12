// Seed: 3187213152
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
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire  id_7;
  logic id_8;
  ;
endmodule
module module_1 #(
    parameter id_16 = 32'd91,
    parameter id_3  = 32'd76
) (
    input tri0 id_0,
    input wor id_1,
    input wor id_2,
    output uwire _id_3,
    input uwire id_4,
    input wor id_5,
    input supply1 id_6,
    output wand id_7,
    output wand id_8,
    output supply0 id_9,
    input tri1 id_10,
    input wor id_11,
    output supply0 id_12,
    output supply1 id_13,
    output wire id_14,
    input supply1 id_15,
    output supply0 _id_16,
    input wor id_17
);
  id_19 :
  assert property (@(*) id_5);
  union packed {
    union packed {
      logic id_20;
      logic id_21;
      logic id_22;
      logic id_23;
    } id_24;
    integer [1 : id_3  .  id_16] id_25;
  } [-1 : -1 'b0] id_26;
  module_0 modCall_1 (
      id_21,
      id_21,
      id_21,
      id_21,
      id_20,
      id_25
  );
endmodule

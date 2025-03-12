// Seed: 906603175
module module_0 #(
    parameter id_7 = 32'd96,
    parameter id_8 = 32'd59,
    parameter id_9 = 32'd36
) (
    input wire id_0,
    input wand id_1,
    input tri id_2,
    input supply0 id_3,
    input supply0 id_4
    , _id_7,
    output supply0 id_5
    , _id_8
);
  wire  _id_9;
  logic id_10;
  ;
  union packed {
    id_11 id_12;
    logic [id_9 : id_7] id_13;
    logic id_14[id_8 : -1  <= ""];
    logic id_15 = 1;
    logic id_16;
    id_17 id_18;
    logic id_19;
    logic id_20;
  } id_21 = -1;
  assign id_21.id_13 = id_21;
  wire  id_22;
  logic id_23;
  ;
endmodule
module module_1 #(
    parameter id_0 = 32'd87,
    parameter id_3 = 32'd22
) (
    input wand _id_0,
    input wor id_1,
    output tri0 id_2[id_0 : -1],
    input supply0 _id_3,
    input tri1 id_4,
    input tri id_5,
    output uwire id_6,
    inout uwire id_7,
    input wire id_8
);
  struct packed {logic id_10;} [id_0 : id_3] id_11;
  module_0 modCall_1 (
      id_1,
      id_8,
      id_4,
      id_8,
      id_5,
      id_2
  );
  always_latch
  `define pp_12 0
  assign id_11.id_10 = id_0;
endmodule

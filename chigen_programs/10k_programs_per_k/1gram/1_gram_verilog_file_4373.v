// Seed: 925259823
module module_0 #(
    parameter id_20 = 32'd17
) (
    input wire id_0,
    output uwire id_1,
    input tri0 id_2,
    output tri0 id_3
    , id_12,
    input supply0 id_4,
    input wire id_5,
    input wor id_6,
    input supply1 id_7,
    input wor id_8,
    output tri1 id_9,
    output tri1 id_10
);
  logic [7:0] id_13, id_14, id_15;
  if (1) wire id_16;
  else wire id_17, id_18, id_19, _id_20, id_21, id_22;
  assign id_22 = id_15[id_20];
  logic id_23;
  ;
  wire id_24;
  ;
  always return "";
  assign module_1.id_23 = 0;
  wire id_25;
  struct packed {
    logic id_26;
    logic id_27;
  } [1 : 1]
      id_28, id_29;
  logic id_30;
endmodule
module module_1 #(
    parameter id_21 = 32'd55
) (
    output wand id_0,
    input wand id_1,
    input wand id_2,
    input supply0 id_3,
    input tri1 id_4,
    input wor id_5[id_21 : -1  ?  (  -1  ) : -1],
    input wor id_6,
    output wand id_7,
    input supply0 id_8,
    input tri0 id_9,
    input tri0 id_10,
    input wor id_11,
    input wor id_12,
    input wire id_13,
    input tri1 id_14,
    input tri1 id_15,
    input wor id_16,
    output tri0 id_17,
    output supply0 id_18,
    output tri id_19,
    input tri0 id_20,
    output supply0 _id_21,
    input supply1 id_22,
    input supply0 id_23,
    input supply0 id_24,
    input wand id_25,
    output uwire id_26,
    input supply0 id_27,
    input tri id_28
);
  id_30 :
  assert property (@(1) id_12) $clog2(6);
  ;
  wire id_31;
  module_0 modCall_1 (
      id_6,
      id_17,
      id_2,
      id_26,
      id_23,
      id_16,
      id_16,
      id_4,
      id_10,
      id_19,
      id_7
  );
  assign id_21 = id_15;
endmodule

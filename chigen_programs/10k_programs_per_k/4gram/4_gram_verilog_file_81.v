// Seed: 3811400286
module module_0 (
    input supply0 id_0,
    input tri id_1,
    input wand id_2,
    input uwire id_3,
    input uwire id_4,
    input uwire id_5,
    input wire id_6,
    output wand id_7
    , id_25,
    input tri1 id_8,
    output wire id_9,
    output uwire id_10,
    input supply0 id_11,
    input tri0 id_12
    , id_26,
    output supply0 id_13,
    output tri1 id_14,
    input wire id_15,
    input tri1 id_16,
    input uwire id_17,
    output uwire id_18,
    output tri id_19,
    input wire id_20,
    output wand id_21,
    input wand id_22,
    input uwire id_23
);
  logic id_27;
  ;
  assign id_9 = id_1;
  wire id_28;
  assign module_1.id_0 = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd15
) (
    input tri1 id_0
    , id_12,
    input wire id_1,
    input wire _id_2,
    input wire id_3,
    input supply0 id_4,
    input wor id_5,
    input uwire id_6,
    output wand id_7,
    input tri1 id_8,
    output supply0 id_9,
    output wire id_10
);
  wire [-1 : id_2] id_13;
  localparam id_14 = -1;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_8,
      id_5,
      id_8,
      id_8,
      id_4,
      id_10,
      id_6,
      id_9,
      id_10,
      id_0,
      id_6,
      id_7,
      id_9,
      id_0,
      id_1,
      id_8,
      id_7,
      id_7,
      id_6,
      id_9,
      id_0,
      id_1
  );
  logic id_15;
  assign id_15 = 1;
  assign id_13 = id_15;
  id_16 :
  assert property (@(posedge -1) 1'b0)
  else $signed(71);
  ;
  assign id_15 = id_5;
  wire id_17;
endmodule

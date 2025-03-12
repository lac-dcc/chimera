// Seed: 1508629536
module module_0 #(
    parameter id_14 = 32'd66,
    parameter id_16 = 32'd15
) (
    output supply0 id_0,
    input wire id_1,
    input wire id_2
    , id_8,
    input tri1 id_3[-1 : 1 'h0],
    input wor id_4,
    output wire id_5,
    input uwire id_6
);
  logic id_9, id_10, id_11;
  assign id_8 = id_2;
  reg id_12, id_13, _id_14, id_15;
  initial id_8 <= id_2;
  assign {1} = ~1;
  localparam id_16 = -1;
  parameter id_17 = id_16.id_16;
  assign id_12 = 1;
  assign module_1.id_11 = 0;
  localparam id_18 = id_17 / id_17[id_16+id_14&1];
  assign id_9 = ~(id_13);
  assign id_5 = 1 | -1;
  always begin : LABEL_0
    id_13 <= id_17;
  end
endmodule
module module_1 #(
    parameter id_20 = 32'd75
) (
    input wand id_0,
    output wand id_1,
    output supply1 id_2,
    output uwire id_3,
    input uwire id_4,
    input tri0 id_5,
    input wand id_6,
    output uwire id_7,
    output wand id_8,
    input wire id_9,
    output wor id_10,
    input tri1 id_11,
    input supply0 id_12,
    input tri1 id_13
    , id_22,
    output uwire id_14,
    input wire id_15,
    output tri id_16
    , id_23,
    input supply1 id_17,
    input tri id_18,
    input tri id_19,
    input uwire _id_20
);
  assign id_10 = id_22;
  assign id_16 = |id_12;
  final id_23 = 1;
  wire [-1 : -1] id_24[-1 : 1];
  struct packed {logic id_25;} id_26;
  ;
  initial @(-1 or -1 or posedge id_6);
  id_27 :
  assert property (@(*) id_24)
  else disable id_28[1==-1][1 : id_20];
  module_0 modCall_1 (
      id_16,
      id_11,
      id_6,
      id_11,
      id_12,
      id_10,
      id_11
  );
endmodule

// Seed: 2895970364
macromodule module_0 (
    output wand id_0,
    input wand id_1,
    output uwire id_2,
    output supply0 id_3,
    input wand id_4
);
  logic [-1 : 1 'b0] id_6;
  ;
  assign module_1._id_2 = 0;
endmodule
module module_1 #(
    parameter id_16 = 32'd93,
    parameter id_2  = 32'd55,
    parameter id_4  = 32'd1
) (
    input uwire id_0,
    input tri id_1,
    output wor _id_2,
    output tri0 id_3,
    input uwire _id_4,
    input tri id_5,
    input tri1 id_6,
    output wire id_7,
    output wire id_8,
    input tri1 id_9,
    input supply1 id_10,
    input wire id_11,
    input tri1 id_12,
    input tri0 id_13,
    input wire id_14,
    input tri1 id_15,
    input tri0 _id_16,
    output wor id_17
);
  wire [-1 : 1  ==  id_4] id_19;
  wire id_20;
  id_21 :
  assert property (@(posedge 1) -1 - id_4)
  else;
  wire id_22;
  struct packed {
    logic [id_16 : id_4] id_23;
    logic [-1 : id_2] id_24;
  } id_25;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_8,
      id_3,
      id_9
  );
endmodule

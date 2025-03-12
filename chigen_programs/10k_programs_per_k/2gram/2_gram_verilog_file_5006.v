// Seed: 2976399869
program module_0 (
    input tri1 id_0,
    input wire id_1,
    output wor id_2,
    output supply0 id_3,
    input wand id_4,
    input supply0 id_5,
    input wor id_6
);
  tri id_8;
  assign id_2 = id_5;
  assign id_8 = -1;
  logic id_9;
  wire  id_10;
  wire  id_11;
  assign id_10 = id_8;
endprogram
module module_1 #(
    parameter id_16 = 32'd44,
    parameter id_22 = 32'd75,
    parameter id_3  = 32'd23,
    parameter id_32 = 32'd38,
    parameter id_5  = 32'd51,
    parameter id_8  = 32'd51
) (
    output supply1 id_0,
    output wand id_1,
    output tri1 id_2,
    input tri _id_3,
    input wand id_4,
    inout supply0 _id_5,
    output wire id_6,
    input supply0 id_7,
    output wire _id_8,
    input tri1 id_9,
    input wor id_10,
    output supply0 id_11,
    input uwire id_12,
    output wire id_13,
    input supply0 id_14,
    input wand id_15,
    input uwire _id_16,
    input wand id_17,
    output tri0 id_18,
    output tri id_19,
    output tri0 id_20,
    input wor id_21,
    input uwire _id_22,
    input tri id_23
);
  wire [1 : id_22] id_25;
  assign id_11 = id_17;
  logic [id_3 : id_8] id_26 = -1'd0;
  id_27 :
  assert property (@(posedge 1 or posedge id_17) -1 !=? 1'd0)
  else;
  wire id_28;
  wire id_29;
  wire id_30;
  function reg id_31;
    input [1 : id_16] _id_32;
    output [id_5 : {  -1  ,  -1  ,  id_32  }] id_33;
    id_31 = -1'b0;
  endfunction
  module_0 modCall_1 (
      id_21,
      id_9,
      id_19,
      id_2,
      id_10,
      id_12,
      id_7
  );
  initial begin
    id_31(id_28, id_26);
  end
endmodule

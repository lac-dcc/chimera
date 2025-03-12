// Seed: 4201170809
module module_0 #(
    parameter id_23 = 32'd24,
    parameter id_27 = 32'd88
) (
    input  uwire id_0,
    output tri0  id_1,
    output tri1  id_2,
    input  wor   module_0,
    input  wor   id_4
);
  `define pp_6 (  pp_7  ,  pp_8  )  0
  id_9 :
  assert property (@(id_3) 1 * `pp_8 - 1'b0)
  else begin : LABEL_0
    `pp_6 = 1'h0;
  end
  wire  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  _id_23  ,  id_24  ,  id_25  ,  id_26  ,  _id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ;
  timeunit 1ps / 1ps;
  localparam [id_27 : id_23] id_35 = 1;
endmodule
module module_1 (
    input wand id_0,
    output tri0 id_1,
    input uwire id_2,
    input tri1 id_3,
    input wor id_4,
    input wand id_5,
    output tri id_6,
    input tri1 id_7,
    input supply1 id_8,
    output wire id_9,
    output tri0 id_10,
    input wand id_11,
    output tri0 id_12,
    output uwire id_13,
    output supply1 id_14,
    input tri id_15,
    input wor id_16,
    input supply1 id_17,
    output uwire id_18,
    output supply1 id_19,
    input wire id_20,
    output tri0 id_21
);
  wire id_23;
  ;
  logic id_24;
  module_0 modCall_1 (
      id_2,
      id_18,
      id_13,
      id_5,
      id_16
  );
endmodule

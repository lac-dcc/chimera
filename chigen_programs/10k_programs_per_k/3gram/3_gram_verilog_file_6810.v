// Seed: 1345016624
module module_0 (
    input supply1 id_0,
    input uwire id_1,
    output tri0 id_2,
    output wor id_3,
    input wor id_4,
    output tri0 id_5,
    input uwire id_6,
    output wand id_7,
    output tri1 id_8,
    input tri id_9,
    output tri0 id_10
);
  supply1  id_12  =  id_1  ,  id_13  =  id_13  ,  id_14  =  id_6  ,  id_15  =  1  ,  id_16  =  -1  ,  id_17  =  -1 'd0 ,  id_18  =  id_13  ,  id_19  =  id_14  ,  id_20  =  id_4  ,  id_21  =  id_0  ,  id_22  =  id_15  ,  id_23  =  -1  ,  id_24  =  id_15  ,  id_25  =  id_4  <  id_23  &&  id_15  ,  id_26  =  -1 'b0 ,  id_27  =  1  ;
endmodule
module module_1 (
    input tri0 id_0,
    output supply0 id_1,
    output logic id_2
    , id_13,
    input wire id_3,
    input wand id_4,
    input supply1 id_5,
    input supply1 id_6,
    output wand id_7,
    input wire id_8,
    input tri id_9,
    input wire id_10,
    input wand id_11
);
  always_ff
  fork
    if (~1) begin : LABEL_0
      id_2 = -1 * id_0;
      @(id_6 or posedge id_3);
    end
  join_none
  module_0 modCall_1 (
      id_11,
      id_5,
      id_1,
      id_7,
      id_11,
      id_7,
      id_9,
      id_7,
      id_1,
      id_8,
      id_1
  );
  assign modCall_1.id_13 = 0;
  localparam id_14 = -1;
endmodule

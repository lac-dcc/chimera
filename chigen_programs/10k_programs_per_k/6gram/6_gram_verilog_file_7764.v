// Seed: 4054793173
module module_0 (
    output logic id_0,
    input supply0 id_1,
    input uwire id_2,
    input tri1 id_3,
    input wire id_4,
    input tri1 id_5
);
  parameter id_7 = 1;
  parameter id_8 = -1;
  always @(posedge -1 or negedge 1) id_0 <= -1;
  assign id_0 = -1;
  wire id_9 = 1;
  wire  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ;
endmodule
module module_1 #(
    parameter id_1 = 32'd53
) (
    input tri1 id_0,
    input supply0 _id_1,
    output uwire id_2,
    input wire id_3,
    output wand id_4,
    input supply1 id_5,
    output logic id_6
);
  wire  id_8;
  logic id_9;
  ;
  bit [-1 : id_1] id_10;
  initial begin : LABEL_0
    id_10 <= id_8;
    id_6  <= 1'b0;
  end
  and primCall (id_4, id_0, id_8);
  module_0 modCall_1 (
      id_6,
      id_3,
      id_0,
      id_0,
      id_5,
      id_3
  );
endmodule

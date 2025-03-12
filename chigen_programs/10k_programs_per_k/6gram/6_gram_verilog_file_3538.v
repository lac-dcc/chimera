// Seed: 2724992840
module module_0 (
    input  wand  id_0,
    input  tri   id_1,
    input  tri0  id_2,
    output tri1  id_3,
    input  wand  id_4,
    output uwire id_5
);
  wand  id_7  ,  id_8  ,  id_9  ,  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ;
  assign id_5 = id_10;
  assign id_9 = 1;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input tri id_0,
    input tri0 id_1,
    input supply0 id_2,
    input tri0 id_3,
    input wor id_4,
    output wor id_5,
    output logic id_6
);
  assign id_6 = 1'd0 !=? id_4;
  assign id_6 = -1'b0;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_5,
      id_3,
      id_5
  );
  wire id_8;
  always @(posedge id_0 or posedge -1) begin : LABEL_0
    id_6 <= id_0;
  end
endmodule

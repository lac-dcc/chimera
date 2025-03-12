// Seed: 2170926903
module module_0 (
    output uwire id_0,
    input tri id_1,
    input wor id_2,
    input wand id_3,
    input tri0 id_4,
    input wand id_5,
    input wire id_6,
    input wor id_7,
    input tri0 id_8
    , id_22,
    input supply1 id_9,
    input tri id_10,
    input supply1 id_11
    , id_23,
    input supply0 id_12,
    input wor id_13,
    output wire id_14,
    output supply0 id_15,
    input wor id_16,
    input tri0 id_17,
    input tri0 id_18,
    input supply1 id_19,
    input tri1 id_20
);
  wire id_24;
endmodule
module module_1 #(
    parameter id_1 = 32'd88,
    parameter id_5 = 32'd25
) (
    output supply1 id_0,
    input tri _id_1,
    output logic id_2,
    input tri1 id_3
);
  always @(posedge id_3) begin : LABEL_0
    id_2 = id_1;
  end
  module_0 modCall_1 (
      id_0,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_0,
      id_0,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
  assign modCall_1.id_0 = 0;
  for (_id_5 = id_3; id_5 & id_3; id_2 = -1) begin : LABEL_1
    always @(posedge {-1{id_3}});
    wire [{  (  {  {  -1  {  id_1  +  id_5  }  }  {  id_5  }  }  )  ,  id_5  ,  1 'b0 -  -1  } :
        id_1] id_6;
  end
endmodule

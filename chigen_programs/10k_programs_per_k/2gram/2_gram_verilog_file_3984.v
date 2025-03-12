// Seed: 2713975535
module module_0 (
    output tri1 id_0,
    input uwire id_1,
    output supply1 id_2,
    input wand id_3
    , id_8,
    output tri1 id_4,
    input uwire id_5,
    output tri0 id_6#(
        .id_9 (-1'b0),
        .id_10(1)
    )
);
  wire id_11;
  assign id_10 = id_1;
  assign id_4  = id_3;
  wire id_12;
  wire  [  1  :  1  ]  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ;
endmodule
module module_1 (
    output tri   id_0,
    output uwire id_1,
    input  wand  id_2,
    output logic id_3,
    output wire  id_4
);
  assign id_0 = id_2;
  always id_3 = new[1 + id_2] (1'b0);
  assign id_0 = 1 & 1 & id_2;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_4,
      id_2,
      id_0,
      id_2,
      id_0
  );
  always id_3 = 1;
endmodule

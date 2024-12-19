// Seed: 551888897
module module_0 (
    input wor id_0,
    input tri id_1,
    input supply1 id_2,
    input supply0 id_3
);
  always @(1)
  fork
    id_5 <= "";
    `define pp_6 0
    id_5 = 1;
    #1;
  join_any
  assign `pp_6 = id_1;
  supply1 id_7 = 1'b0;
  tri1  id_8  ,  id_9  ,  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ;
  wire id_24;
  assign id_9 = id_14;
  assign module_1.id_2 = 0;
  wire id_25;
endmodule
module module_1 (
    input  wand  id_0,
    output logic id_1,
    input  wor   id_2
);
  always @(posedge id_2 or posedge id_0) id_1 <= id_2 << 1;
  wire id_4;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_2
  );
  assign id_1 = 1;
endmodule

// Seed: 668515548
module module_0 #(
    parameter id_12 = 32'd71,
    parameter id_13 = 32'd89
) (
    input wor id_0
    , id_11,
    input wand id_1,
    input wand id_2,
    output supply0 id_3,
    input tri1 id_4,
    input wor id_5,
    input supply0 id_6,
    output supply1 id_7,
    input tri0 id_8,
    output uwire id_9
);
  wire _id_12;
  parameter id_13 = -1;
  assign id_3 = id_8;
  wire id_14, id_15;
  localparam id_16 = 1'b0;
  assign module_1.id_10 = 0;
  wire id_17, id_18[id_13  #  (  .  id_12  (  {  1  { "" }  }  )  ) : {  1 'b0 }], id_19, id_20;
endmodule
module module_1 (
    output supply1 id_0,
    input supply1 id_1,
    input wire id_2,
    output supply0 id_3,
    input wor id_4,
    output wire id_5,
    input supply1 id_6,
    input wor id_7,
    input supply0 id_8,
    input uwire id_9,
    input uwire id_10
);
  wire id_12;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_8,
      id_5,
      id_6,
      id_7,
      id_4,
      id_3,
      id_1,
      id_0
  );
  or primCall (id_0, id_8, id_7, id_12, id_1, id_10, id_2, id_9, id_4, id_6);
endmodule

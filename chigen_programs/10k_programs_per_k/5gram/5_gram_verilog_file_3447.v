// Seed: 3786614291
module module_0 (
    output supply1 id_0,
    input supply1 id_1,
    input supply0 id_2,
    output wire id_3,
    input tri0 id_4,
    input tri0 id_5
);
  wire id_7;
  ;
  assign id_3 = -1;
endmodule
module module_1 #(
    parameter id_10 = 32'd44,
    parameter id_11 = 32'd29,
    parameter id_14 = 32'd90,
    parameter id_7  = 32'd82,
    parameter id_8  = 32'd40
) (
    input uwire id_0,
    input tri0 id_1,
    input supply1 id_2,
    input wire id_3,
    output tri1 id_4,
    input wire id_5,
    input wire id_6,
    input supply1 _id_7,
    inout tri1 _id_8,
    input tri1 id_9,
    input wor _id_10,
    input wor _id_11,
    input uwire id_12,
    input wor id_13,
    input wor _id_14
);
  logic [7:0][1 : id_14] id_16;
  assign id_16[-1] = id_3;
  module_0 modCall_1 (
      id_4,
      id_5,
      id_1,
      id_4,
      id_5,
      id_1
  );
  assign modCall_1.id_0 = 0;
  assign id_8 = id_2;
  assign id_4 = 1;
  logic [id_11  #  (  .  id_7  (  {  !  id_8  ,  id_8  +  1 'b0 }  )  ) : id_10] id_17,
      id_18 = id_6 == 1;
endmodule

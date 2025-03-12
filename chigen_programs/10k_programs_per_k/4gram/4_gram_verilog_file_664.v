// Seed: 2679801897
module module_0 (
    input uwire id_0,
    input tri1 id_1,
    input wire id_2,
    input tri1 id_3,
    input wand id_4,
    input wand id_5,
    input wor id_6,
    output tri1 id_7,
    input tri1 id_8,
    input supply1 id_9,
    input tri id_10,
    input wor id_11,
    output tri1 id_12
);
  parameter id_14 = -1'b0;
endmodule
module module_1 #(
    parameter id_1 = 32'd24,
    parameter id_2 = 32'd28,
    parameter id_3 = 32'd71,
    parameter id_6 = 32'd32
) (
    input  wire  id_0,
    input  wire  _id_1,
    input  tri0  _id_2,
    output tri1  _id_3,
    output uwire id_4
);
  integer _id_6;
  wire id_7;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_4,
      id_0,
      id_0,
      id_0,
      id_0,
      id_4
  );
  struct packed {
    logic [id_1 : {  id_2  -  id_1  {  id_3  }  }] id_8;
    logic [~  id_6  #  (
        .  id_3(  1  ),
        .  id_2(  id_1  ),
        .  id_3(  id_3  )
) : id_6] id_9;
  } [1  +  id_6  +  id_6 : id_2] id_10;
  ;
  wire id_11;
  ;
endmodule

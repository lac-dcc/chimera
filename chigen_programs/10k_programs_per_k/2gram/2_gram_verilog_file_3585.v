// Seed: 870170733
module module_0 (
    input tri1 id_0,
    output supply1 id_1
    , id_12,
    input wand id_2,
    input wire id_3
    , id_13,
    input uwire id_4,
    input supply0 id_5,
    input tri0 id_6,
    input tri id_7,
    input supply0 id_8,
    input tri0 id_9,
    output tri1 id_10
);
  logic id_14;
  assign module_1.id_9 = 0;
  assign id_1 = id_12;
endmodule
module module_1 #(
    parameter id_0  = 32'd31,
    parameter id_11 = 32'd17,
    parameter id_12 = 32'd9,
    parameter id_5  = 32'd65,
    parameter id_6  = 32'd56
) (
    input tri1 _id_0,
    input tri id_1,
    input supply1 id_2,
    input uwire id_3,
    output supply1 id_4,
    output supply1 _id_5,
    input uwire _id_6,
    output supply0 id_7,
    input uwire id_8,
    output tri0 id_9,
    input supply1 id_10,
    input tri0 _id_11,
    output supply1 _id_12
);
  logic [id_12 : (  id_11  )] id_14;
  nor primCall (id_7, id_14, id_3, id_15);
  logic id_15;
  ;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_3,
      id_10,
      id_3,
      id_1,
      id_10,
      id_10,
      id_10,
      id_10,
      id_7
  );
  logic [{  1  ,  -1  ,  id_0  }  ?  id_6 : id_11 : id_12  -  1] id_16;
  logic [id_5  +  -1 : -1 'b0] id_17;
endmodule

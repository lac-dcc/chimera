// Seed: 3010098299
module module_0 (
    input wand id_0,
    output uwire id_1,
    output wor id_2,
    output supply1 id_3,
    input tri0 id_4,
    input tri0 id_5
);
  logic id_7;
  assign module_1.id_2  = 0;
  assign module_2._id_3 = 0;
endmodule
module module_1 (
    output tri   id_0,
    input  wire  id_1,
    output uwire id_2,
    input  tri0  id_3,
    output tri0  id_4
);
  assign id_0 = id_3 - 1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_4,
      id_4,
      id_3,
      id_1
  );
  assign id_2 = 1;
endmodule
module module_2 #(
    parameter id_1  = 32'd44,
    parameter id_10 = 32'd96,
    parameter id_3  = 32'd30,
    parameter id_7  = 32'd67
) (
    input wand id_0,
    input uwire _id_1,
    input supply1 id_2,
    input tri0 _id_3,
    output wire id_4,
    input tri id_5,
    output tri0 id_6,
    input tri _id_7,
    input wor id_8,
    input supply1 id_9,
    output tri _id_10
);
  struct packed {
    struct packed {logic [-1  ==  1 : id_1] id_12;} [{  id_7  -  1  ,  1  } : id_10] id_13;
    logic [id_7 : 1] id_14;
  } [id_3 : 1] id_15;
  ;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_6,
      id_6,
      id_9,
      id_5
  );
endmodule

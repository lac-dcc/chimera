// Seed: 2196990747
module module_0 (
    output tri  id_0,
    output wire id_1,
    output wor  id_2
);
  wire id_4;
  assign module_1.id_5 = 0;
  logic id_5;
  wire id_6, id_7, id_8, id_9;
  localparam id_10 = -1;
  wire id_11;
endmodule
module module_1 #(
    parameter id_11 = 32'd90,
    parameter id_6  = 32'd54
) (
    output supply1 id_0,
    output wor id_1,
    output tri1 id_2,
    input tri1 id_3,
    output uwire id_4,
    input tri0 id_5
    , _id_11,
    output tri _id_6,
    input uwire id_7,
    input tri1 id_8,
    input tri id_9
);
  localparam id_12[id_11 : id_6] = 1;
  nor primCall (id_4, id_8, id_5, id_3, id_12, id_7, id_9);
  module_0 modCall_1 (
      id_1,
      id_0,
      id_4
  );
endmodule

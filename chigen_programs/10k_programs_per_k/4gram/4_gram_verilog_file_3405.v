// Seed: 1054311216
module module_0 (
    input uwire id_0,
    input wor id_1,
    input wor id_2,
    input tri id_3,
    input tri id_4,
    output supply0 id_5,
    output uwire id_6,
    output wand id_7,
    input uwire id_8,
    output uwire id_9,
    output tri id_10,
    input supply1 id_11,
    output tri id_12,
    output tri1 id_13
);
  tri id_15 = 1, id_16;
  assign module_1.id_6 = 0;
endmodule
module module_1 #(
    parameter id_0  = 32'd77,
    parameter id_10 = 32'd90,
    parameter id_14 = 32'd76,
    parameter id_3  = 32'd99,
    parameter id_5  = 32'd52,
    parameter id_7  = 32'd31
) (
    input tri1 _id_0,
    input uwire id_1,
    output tri id_2,
    input tri1 _id_3,
    input supply0 id_4,
    input wand _id_5
    , _id_10,
    output uwire id_6,
    input tri _id_7
    , id_11,
    output wor id_8
);
  wire id_12 = id_4;
  tri0 id_13;
  ;
  localparam id_14 = 1;
  logic [7:0][id_10  >  id_14  -  ~  id_10 : id_7] id_15 = id_1;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_4,
      id_4,
      id_1,
      id_2,
      id_8,
      id_2,
      id_1,
      id_8,
      id_6,
      id_1,
      id_2,
      id_8
  );
  logic [id_0 : id_3] id_16;
  ;
  logic id_17;
  generate
    always @(posedge id_15[id_5] or negedge "") id_17 = 1;
  endgenerate
  assign id_13 = -1;
endmodule

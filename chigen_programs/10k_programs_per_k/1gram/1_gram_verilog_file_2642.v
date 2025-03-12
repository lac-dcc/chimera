// Seed: 520520923
module module_0 #(
    parameter id_13 = 32'd26
) (
    input tri0 id_0[id_13 : -1 'd0],
    input uwire id_1,
    input supply1 id_2,
    input wire id_3,
    input supply1 id_4,
    output tri id_5
    , id_17,
    output uwire id_6,
    input uwire id_7,
    input tri1 id_8
    , id_18,
    output supply1 id_9,
    input wand id_10,
    output supply0 id_11,
    output tri id_12,
    output tri _id_13,
    output supply1 id_14,
    output supply0 id_15
);
  logic id_19;
  ;
  wire [1 : -1] id_20, id_21[1 : 1 'b0], id_22;
  struct packed {
    logic id_23;
    logic id_24;
    enum {id_25 = id_4} id_26;
    logic id_27;
  } id_28;
endmodule
module module_1 #(
    parameter id_13 = 32'd5,
    parameter id_24 = 32'd21,
    parameter id_5  = 32'd67
) (
    input tri0 id_0,
    input tri0 id_1
    , id_23,
    output wand id_2,
    input tri1 id_3,
    output tri1 id_4,
    input wor _id_5,
    input wand id_6,
    input supply0 id_7,
    output wor id_8,
    output wor id_9,
    input wand id_10,
    input wire id_11,
    input tri1 id_12,
    input tri1 _id_13[-1 : (  id_5  )],
    input tri id_14,
    output wand id_15,
    input supply0 id_16,
    output wor id_17,
    input wor id_18,
    input tri0 id_19,
    input supply0 id_20,
    input tri id_21
);
  parameter id_24 = -1;
  struct packed {id_25 id_26;} id_27;
  ;
  wire id_28, id_29;
  tri0 id_30 = -1 !=? 1, id_31[-1 : id_13];
  defparam id_24 = -1, id_24 = id_24, id_24 = 1, id_24 = 1;
  assign id_9 = 1;
  module_0 modCall_1 (
      id_0,
      id_20,
      id_12,
      id_21,
      id_19,
      id_17,
      id_15,
      id_18,
      id_7,
      id_8,
      id_0,
      id_8,
      id_4,
      id_24,
      id_4,
      id_9
  );
  assign modCall_1.id_2 = 0;
  wire id_32;
endmodule

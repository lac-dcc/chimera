// Seed: 327059982
module module_0 #(
    parameter id_2 = 32'd34
) (
    id_1,
    _id_2[-1 : id_2==""]
);
  output logic [7:0] _id_2;
  inout wire id_1;
  wire id_3;
  ;
endmodule
module module_1 #(
    parameter id_1  = 32'd59,
    parameter id_13 = 32'd85,
    parameter id_14 = 32'd57,
    parameter id_15 = 32'd54,
    parameter id_2  = 32'd61,
    parameter id_5  = 32'd62,
    parameter id_6  = 32'd72,
    parameter id_9  = 32'd41
) (
    input uwire id_0,
    input tri0 _id_1,
    input wor _id_2,
    input supply1 id_3,
    input tri1 id_4,
    input wire _id_5,
    input wor _id_6,
    input wire id_7,
    input wor id_8,
    input uwire _id_9,
    input tri id_10,
    input tri id_11,
    input supply1 id_12[-1 'b0 ^  id_5  -  id_9  #  (
        .  id_9 (  id_2  ),
        .  id_1 (  -1  ),
        .  id_15(  id_14  )
) : -1],
    input tri _id_13,
    output wor _id_14,
    input supply0 _id_15
);
  wire [1 : id_2] id_17;
  assign id_14 = {id_9};
  logic id_18;
  module_0 modCall_1 (
      id_17,
      id_14
  );
  union packed {
    id_19 id_20;
    logic id_21;
  } id_22[-1 : id_6] = 1;
  wire id_23[1 'b0 : (  -1  )];
  wire id_24;
  xor primCall (id_14, id_12, id_3, id_7, id_18, id_17, id_8, id_0, id_10, id_11);
  assign id_22.id_20 = -1'b0;
  wire [1 : id_13] id_25;
endmodule

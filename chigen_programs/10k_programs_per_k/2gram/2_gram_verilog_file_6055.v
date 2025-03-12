// Seed: 4163591089
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = id_3;
endmodule
module module_1 #(
    parameter id_14 = 32'd84,
    parameter id_6  = 32'd21,
    parameter id_9  = 32'd42
) (
    output supply0 id_0,
    output wand id_1,
    output wor id_2,
    input tri1 id_3,
    input wor id_4#(
        .id_11(1),
        .id_12(1),
        .id_13(1)
    ),
    input wor id_5,
    output wire _id_6,
    input tri1 id_7#(
        ._id_14(1),
        .id_15 (1'b0),
        .id_16 (1'h0),
        .id_17 (1),
        .id_18 (1),
        .id_19 (1)
    ),
    input tri1 id_8,
    input tri _id_9
);
  assign id_18 = id_13;
  module_0 modCall_1 (
      id_13,
      id_13,
      id_18
  );
  wire id_20;
  xor primCall (id_0, id_3, id_19, id_12, id_7, id_17, id_15, id_13, id_4, id_5, id_8);
  logic [1 : id_9] id_21;
  wire id_22;
  ;
  struct packed {
    logic id_23;
    logic [id_6 : id_14] id_24;
    logic id_25;
    logic id_26;
  } id_27;
  ;
  assign id_20 = id_15;
endmodule

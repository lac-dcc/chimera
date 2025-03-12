// Seed: 1885470026
module module_0 (
    input wand  id_0,
    input tri0  id_1,
    input uwire id_2,
    input uwire id_3,
    input wor   id_4,
    input tri   id_5,
    input wor   id_6
);
  if (1) begin : LABEL_0
    logic [7:0]
        id_8,
        id_9,
        id_10,
        id_11,
        id_12,
        id_13,
        id_14,
        id_15,
        id_16,
        id_17,
        id_18,
        id_19,
        id_20,
        id_21,
        id_22,
        id_23,
        id_24,
        id_25,
        id_26,
        id_27,
        id_28,
        id_29,
        id_30,
        id_31,
        id_32,
        id_33;
    assign id_30 = id_31[-1'b0];
  end else bit id_34;
  always_ff begin : LABEL_1
    @(posedge 1) begin : LABEL_2
      id_34 <= 1;
    end
    $clog2(48);
    ;
    return id_4;
    id_34 <= 1;
  end
endmodule
module module_1 #(
    parameter id_0  = 32'd21,
    parameter id_12 = 32'd67,
    parameter id_2  = 32'd29
) (
    input wor _id_0,
    input tri1 id_1,
    input supply1 _id_2,
    input wor id_3,
    input supply0 id_4,
    input supply0 id_5,
    input tri1 id_6
    , id_8
);
  wor id_9 = -1;
  module_0 modCall_1 (
      id_5,
      id_3,
      id_6,
      id_4,
      id_5,
      id_1,
      id_3
  );
  logic [7:0][id_2 : 1] id_10;
  logic id_11;
  assign id_9 = id_3;
  assign id_10[-1] = 1;
  assign id_8 = id_6 - id_9;
  parameter id_12 = -1;
  logic [1  ^  1  !=?  id_0 : 1 'b0] id_13;
  assign id_13[id_12] = id_3;
  assign id_9 = id_1;
endmodule

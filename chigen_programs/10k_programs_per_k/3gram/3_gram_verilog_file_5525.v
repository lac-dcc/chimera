// Seed: 2817028371
module module_0 (
    input supply0 id_0,
    output supply0 id_1,
    input tri1 id_2,
    input tri1 id_3
    , id_12,
    input tri id_4,
    input uwire id_5,
    input supply0 id_6,
    input uwire id_7
    , id_13,
    input supply0 id_8,
    input tri1 id_9
    , id_14,
    output wor id_10
);
  assign id_1 = (1);
  tri id_15, id_16, id_17, id_18, id_19, id_20, id_21, id_22, id_23, id_24;
  wire id_25;
  wire id_26;
  assign id_20 = 1;
  assign id_21 = {1{1'b0 | id_15}};
  wire id_27, id_28;
  assign id_19 = id_15;
endmodule
module module_1 (
    output supply0 id_0
    , id_11,
    output tri1 id_1,
    input supply0 id_2,
    output wor id_3,
    input tri1 id_4
    , id_12,
    input tri0 id_5,
    input wor id_6,
    input uwire id_7,
    output supply0 id_8,
    input uwire id_9
);
  assign id_0 = 1'b0;
  wire id_13;
  id_14(
      .id_0(1), .id_1(1), .id_2(id_5), .id_3(1)
  );
  integer id_15 = 1;
  logic [7:0] id_16;
  wire id_17;
  module_0 modCall_1 (
      id_6,
      id_8,
      id_2,
      id_5,
      id_4,
      id_5,
      id_6,
      id_4,
      id_2,
      id_7,
      id_0
  );
  assign modCall_1.type_1 = 0;
  id_18(
      .id_0(1), .id_1(id_15)
  );
  wire id_19;
  assign id_16[1] = 1;
  always @(*) begin : LABEL_0
    id_11 <= 1;
  end
endmodule

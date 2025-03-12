// Seed: 2887858832
module module_0 (
    output tri id_0,
    input tri id_1,
    output tri id_2,
    input tri id_3,
    input tri1 id_4,
    output tri1 id_5,
    input tri1 id_6,
    input tri id_7,
    input uwire id_8,
    input wire id_9,
    output wire id_10
    , id_16,
    output supply0 id_11,
    input wire id_12,
    input tri1 id_13,
    input wor id_14
);
  localparam id_17 = 1 & 1;
  wire  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ,  id_35  ,  id_36  ;
  wire id_37;
  ;
  logic id_38;
  tri0  id_39 = -1;
  wire  id_40;
  ;
  wire  id_41;
  logic id_42;
  ;
  logic id_43;
endmodule
module module_1 (
    input tri1 id_0,
    input wor id_1,
    input tri id_2,
    output tri id_3,
    input wand id_4,
    input supply1 id_5
);
  localparam id_7 = 1;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_3,
      id_2,
      id_5,
      id_3,
      id_1,
      id_1,
      id_2,
      id_5,
      id_3,
      id_3,
      id_4,
      id_0,
      id_1
  );
  assign modCall_1.id_4 = 0;
  assign id_3 = id_0;
endmodule

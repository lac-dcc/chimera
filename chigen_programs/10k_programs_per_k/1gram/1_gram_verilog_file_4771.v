// Seed: 4087750679
module module_0 #(
    parameter id_7 = 32'd54,
    parameter id_8 = 32'd77
) (
    input supply0 id_0[1  *  id_7 : id_8],
    output wand id_1,
    output wor id_2,
    input wire id_3,
    output wand id_4
    , id_14,
    input wand id_5,
    input tri0 id_6,
    input tri1 _id_7,
    output wor _id_8,
    input uwire id_9,
    output wor id_10,
    output wor id_11,
    input supply0 id_12
);
  parameter id_15 = !1;
  wire id_16, id_17, id_18, id_19;
  wire id_20;
endmodule
module module_1 #(
    parameter id_1  = 32'd95,
    parameter id_12 = 32'd76,
    parameter id_3  = 32'd5
) (
    output wand id_0,
    input wire _id_1,
    input supply1 id_2,
    output tri0 _id_3,
    output supply0 id_4,
    input tri0 id_5,
    output supply0 id_6,
    inout wand id_7
);
  assign id_4 = -1 && {1'b0, 1'b0, id_2};
  generate
    logic id_9;
    wire id_10, id_11;
  endgenerate
  parameter id_12[id_1  (  -1  ,  id_3  ,  -1  ) : -1] = -1'b0;
  generate
    logic id_13 = id_2 & 1;
    begin : LABEL_0
      begin : LABEL_1
        wire id_14;
        defparam id_12 = id_12;
      end
    end
  endgenerate
  module_0 modCall_1 (
      id_2,
      id_6,
      id_6,
      id_7,
      id_6,
      id_5,
      id_7,
      id_12,
      id_12,
      id_5,
      id_0,
      id_7,
      id_5
  );
  assign modCall_1.id_6 = 0;
endmodule

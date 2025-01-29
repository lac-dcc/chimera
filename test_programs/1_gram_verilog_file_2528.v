// Seed: 4226104452
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  supply0 id_3, id_4, id_5, id_6;
  wire id_7;
  rnmos (id_3);
  assign id_3 = id_5;
  assign id_4 = id_3 ? id_8 : -1;
  string id_9 = "";
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4#(
        .id_5(1'd0),
        .id_6(1),
        .id_7(-1)
    ),
    id_8,
    id_9,
    id_10
);
  input wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_5 = id_1;
  always if (id_1) $display(-1'b0, 1, id_10);
  module_0 modCall_1 (
      id_10,
      id_8
  );
  assign modCall_1.id_4 = 0;
  tri1 id_11 = 1'd0, id_12, id_13;
  wire id_14, id_15;
  wire id_16;
  assign id_13 = 1'b0 ** -1;
  assign id_13 = id_10;
  generate
    wire id_17, id_18;
    begin : LABEL_0
      wire id_19;
    end
  endgenerate
  always id_5 <= !1;
endmodule

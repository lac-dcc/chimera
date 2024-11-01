// Seed: 2623947872
module module_0 (
    output supply1 id_0,
    input wire id_1,
    input uwire id_2,
    output supply0 id_3,
    input wor id_4,
    output supply0 id_5,
    output wire id_6,
    input supply1 id_7,
    output wor id_8
);
  tri0 id_10;
  id_11(
      .id_0(), .id_1(1), .id_2(1 - 1'b0), .id_3(1), .id_4(id_2), .id_5(1)
  );
  wire id_12;
  assign id_10 = id_4;
  uwire id_13;
  logic [7:0] id_14;
  tri id_15 = ({{id_2, id_10}, id_7, id_13 | 1});
  id_16(
      .id_0(1), .id_1(1'b0), .id_2(id_10), .id_3(id_14), .id_4(1), .id_5(id_6), .id_6(id_0)
  );
  assign id_15 = id_2;
  assign id_0  = id_7;
  wire id_17, id_18;
  tri id_19;
  logic [7:0] id_20, id_21, id_22, id_23, id_24, id_25, id_26, id_27 = id_26;
  tri0 id_28 = id_27[1] == id_7;
  wire id_29, id_30, id_31, id_32;
  wire id_33;
  wire id_34;
  wire id_35;
  supply1 id_36 = id_14[1] - 1;
  wire id_37;
  always @(posedge id_19) @(negedge 1);
endmodule
module module_1 (
    output wand id_0,
    output supply1 id_1,
    input supply1 id_2,
    output logic id_3,
    input supply0 id_4,
    input wor id_5,
    input wire id_6,
    output supply0 id_7,
    output supply1 id_8
);
  tri id_10;
  always @(posedge id_5)
    case (1)
      id_10 < ~id_2: id_10 = 1;
      1'b0: id_3 <= 1;
    endcase
  module_0(
      id_1, id_5, id_4, id_8, id_4, id_0, id_1, id_4, id_1
  );
endmodule

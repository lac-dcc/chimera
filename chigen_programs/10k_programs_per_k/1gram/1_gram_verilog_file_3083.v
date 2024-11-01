// Seed: 1148824707
module module_0 (
    output supply0 id_0,
    output supply1 id_1
);
  tri1 id_3;
  assign id_3 = 1'b0;
  assign id_0 = id_3;
  wire id_4, id_5;
  wire id_6;
  initial id_6 = id_4;
  wire id_7;
  id_8(
      .id_0((1'b0)),
      .id_1(1'h0),
      .id_2(1'b0),
      .id_3(id_0),
      .id_4(id_5),
      .id_5(id_3),
      .id_6(""),
      .id_7(id_4)
  );
endmodule
module module_1 (
    input uwire id_0
    , id_23, id_24,
    input logic id_1,
    output uwire id_2,
    input tri id_3,
    output wor id_4,
    input uwire id_5,
    input uwire id_6,
    output logic id_7,
    output uwire id_8,
    output supply0 id_9,
    output tri id_10,
    input tri id_11,
    input supply1 id_12,
    input wire id_13,
    input wor id_14,
    input wire id_15,
    input wand id_16,
    output wire id_17,
    input wor id_18,
    input supply0 id_19,
    input supply1 id_20,
    input wand id_21
);
  assign id_2 = 1;
  supply1 id_25;
  assign id_7 = id_1;
  id_26 :
  assert property (@(posedge id_24 !== id_13, negedge 1) 1 ^ 1 | id_25) id_7 <= "";
  module_0(
      id_2, id_10
  );
  wire id_27;
endmodule

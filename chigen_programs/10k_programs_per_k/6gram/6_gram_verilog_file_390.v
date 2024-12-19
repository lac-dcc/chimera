// Seed: 2542766052
module module_0 (
    input wand id_0,
    input supply1 id_1,
    input supply1 id_2,
    output uwire id_3,
    input uwire id_4,
    input wire id_5,
    input wand id_6,
    output tri id_7,
    output uwire id_8,
    output tri0 id_9,
    input wire id_10,
    output tri1 id_11,
    output uwire id_12,
    input tri1 id_13,
    input supply0 id_14,
    input wire id_15,
    output wor id_16
);
  assign id_11 = id_6;
  assign id_3 = id_2 + id_6 ? id_1 & id_2 & id_14 : $display;
  assign module_1.id_19 = 0;
endmodule
module module_1 (
    input wand id_0,
    input uwire id_1,
    output supply0 id_2,
    input uwire id_3,
    input wire id_4,
    input tri0 id_5,
    output wire id_6,
    input tri id_7,
    input tri0 id_8,
    output tri id_9,
    input wor id_10,
    input supply1 id_11,
    output supply1 id_12,
    output tri id_13,
    output uwire id_14,
    input wire id_15,
    input wor id_16,
    output uwire id_17,
    input wor id_18,
    output wor id_19,
    input uwire id_20,
    output tri0 id_21,
    output wor id_22,
    input wire id_23,
    output uwire id_24,
    input tri0 id_25,
    input supply1 id_26,
    input wand id_27,
    input uwire id_28,
    inout tri1 id_29,
    output wire id_30
);
  always @(1 or posedge id_15) begin : LABEL_0
    id_6 = (1);
  end
  wire id_32;
  wire id_33;
  wire id_34;
  id_35(
      .id_0(1),
      .id_1(id_28),
      .id_2(id_33),
      .id_3(!id_7),
      .id_4(id_11),
      .id_5(id_11),
      .id_6(1 & 1'd0),
      .id_7({1{1}})
  );
  module_0 modCall_1 (
      id_4,
      id_27,
      id_5,
      id_22,
      id_18,
      id_10,
      id_10,
      id_17,
      id_13,
      id_9,
      id_26,
      id_14,
      id_22,
      id_20,
      id_23,
      id_15,
      id_30
  );
  assign id_2  = 1 ? id_10 : "" ? id_4 : id_29;
  assign id_24 = 1;
endmodule

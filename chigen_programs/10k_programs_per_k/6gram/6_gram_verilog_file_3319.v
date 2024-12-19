// Seed: 3131227632
module module_0 (
    output tri0 id_0,
    input wand id_1,
    input tri1 id_2,
    input tri id_3,
    input wor id_4,
    input wand id_5,
    input tri1 id_6,
    input wor id_7,
    input tri0 id_8,
    input supply0 id_9,
    output tri id_10,
    input tri id_11,
    output supply1 id_12,
    output uwire id_13,
    input wor id_14,
    input uwire id_15,
    input wor id_16,
    input tri0 id_17,
    input wor id_18,
    output supply0 id_19,
    output wire id_20,
    output tri0 id_21
);
  assign id_10 = 1 ? id_8 : id_11 ? 1 : id_14;
  assign module_1.id_3 = 0;
  id_23(
      .id_0(1), .id_1(id_19), .id_2(1)
  ); id_24(
      .id_0(1'h0), .id_1(1 == 1), .id_2(id_2), .id_3(id_10 - 1'd0), .id_4(1'b0)
  );
  assign id_13 = !id_7;
endmodule
program module_1 (
    output tri0 id_0,
    input wor id_1,
    output supply1 id_2,
    input wor id_3,
    input wor id_4,
    output supply1 id_5
);
  assign id_0 = id_3;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_3,
      id_1,
      id_1,
      id_3,
      id_4,
      id_4,
      id_3,
      id_1,
      id_5,
      id_1,
      id_2,
      id_0,
      id_3,
      id_4,
      id_4,
      id_4,
      id_1,
      id_0,
      id_2,
      id_0
  );
  assign id_5 = id_1 << {1 * id_4, 1 == 1};
  reg id_7;
  assign id_2 = id_1;
  buf primCall (id_0, id_1);
  always
    if (1'b0) begin : LABEL_0
      id_7 <= ~id_7;
    end
endprogram

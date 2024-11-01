// Seed: 1820403087
module module_0 (
    output uwire id_0,
    input supply0 id_1,
    output tri1 id_2,
    input tri0 id_3,
    input tri1 id_4,
    input wire id_5,
    output tri0 id_6,
    output supply0 id_7
);
  always @(id_3 or posedge id_1) if (1) assign id_2 = 1'b0;
  id_9(
      .id_0(1'b0),
      .id_1(1'd0),
      .id_2(1'b0),
      .id_3(id_3),
      .id_4(1),
      .id_5(1),
      .id_6(1'b0),
      .id_7(1'b0),
      .id_8(),
      .id_9(id_3 & id_5),
      .id_10(id_3),
      .id_11(1),
      .id_12(1),
      .id_13(1 ? 'b0 : 1'b0),
      .id_14(1'b0)
  );
  assign id_6 = id_1;
endmodule
module module_1 (
    output tri id_0,
    input uwire id_1,
    output wire id_2,
    input supply1 id_3,
    input supply1 id_4,
    output supply1 id_5,
    input tri0 id_6,
    input wand id_7,
    output tri id_8,
    input wor id_9,
    input wire id_10,
    output tri1 id_11,
    input supply1 id_12
);
  module_0(
      id_11, id_7, id_8, id_3, id_1, id_12, id_8, id_5
  );
endmodule

// Seed: 2210805687
module module_0 (
    input tri1 id_0,
    input tri  id_1,
    input tri0 id_2,
    input wor  id_3,
    input tri  id_4,
    input tri1 id_5,
    input wire id_6,
    input wor  id_7
);
  if (1) begin : LABEL_0
    id_9(
        id_2 & {id_2}, "" - id_5, id_6
    ); id_10(
        .id_0(1'b0), .id_1(1)
    );
  end
  id_11(
      id_3, -1'b0, 1, 1'b0, 1'h0, 1'b0
  );
  wire id_12;
endmodule
module module_1 (
    input supply1 id_0,
    output supply0 id_1,
    input wor id_2,
    input wire id_3,
    inout supply0 id_4,
    input wor id_5
);
  assign id_1 = 1;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_3,
      id_0,
      id_3,
      id_4,
      id_4
  );
  assign modCall_1.id_3 = 0;
  always $display(1, 1'b0, 1);
  id_7(
      id_5, 1, id_5, id_5
  );
  xor primCall (id_4, id_5, id_3, id_0, id_2);
  assign id_1 = 1;
endmodule

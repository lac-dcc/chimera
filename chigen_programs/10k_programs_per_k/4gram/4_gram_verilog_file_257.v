// Seed: 1387530339
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  always @(1) begin : LABEL_0
    if (id_2) begin : LABEL_0
      return id_2;
    end
  end
  wire id_3, id_4;
endmodule
module module_1 (
    output supply1 id_0
    , id_6,
    output supply1 id_1,
    input wand id_2,
    input supply0 id_3,
    input wor id_4
);
  supply0 id_7;
  generate
    assign id_6 = 'b0;
  endgenerate
  initial id_1 = {{1'd0, id_3}, id_7 == id_6};
  id_8(
      .id_0(id_1), .id_1(id_7), .id_2(1 & !id_2), .id_3(id_6), .id_4(1)
  );
  module_0 modCall_1 (
      id_7,
      id_6
  );
endmodule

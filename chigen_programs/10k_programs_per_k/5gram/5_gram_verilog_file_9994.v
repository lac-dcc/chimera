// Seed: 1582155529
module module_0 (
    input tri id_0,
    input tri module_0,
    input wor id_2,
    input tri0 id_3,
    output supply1 id_4,
    input supply0 id_5,
    input supply0 id_6,
    input wire id_7,
    input tri0 id_8,
    output uwire id_9,
    input tri1 id_10,
    output tri1 id_11,
    input supply1 id_12,
    input wor id_13
);
  generate
    assign id_11 = 1'b0 ? 1 : id_3;
  endgenerate
  assign module_1.id_9 = 0;
  always @(posedge id_8 or posedge id_13 - id_12) begin : LABEL_0$display
    ;
  end
endmodule
module module_1 (
    input supply1 id_0,
    output tri0 id_1,
    input supply1 id_2,
    input wor id_3,
    input supply0 id_4,
    input wor id_5,
    input wor id_6,
    output supply1 id_7,
    input tri1 id_8,
    input wand id_9,
    inout tri id_10,
    input wire id_11,
    output wor id_12,
    input wor id_13,
    input uwire id_14,
    input wire id_15,
    output supply0 id_16,
    input wand id_17,
    input wire id_18,
    input tri0 id_19
);
  assign id_10 = id_14 ? id_11 == 1 : 1'h0 - id_3;
  module_0 modCall_1 (
      id_2,
      id_11,
      id_2,
      id_4,
      id_1,
      id_6,
      id_6,
      id_9,
      id_2,
      id_16,
      id_6,
      id_16,
      id_10,
      id_18
  );
  supply1 id_21;
  id_22(
      .id_0(id_0),
      .id_1(1),
      .id_2(id_12 == id_9 >= id_21),
      .id_3(1),
      .id_4(),
      .id_5(id_8),
      .id_6(id_8)
  );
  assign id_12 = 1;
  wire id_23, id_24;
endmodule

// Seed: 1703589266
module module_0 (
    input tri id_0,
    input supply1 id_1,
    output supply0 id_2,
    input supply1 id_3,
    output tri0 id_4,
    input wor id_5,
    input tri1 id_6,
    input uwire id_7,
    output tri id_8,
    input wire id_9,
    output uwire id_10
);
  wire id_12;
endmodule
module module_1 (
    output tri1 id_0,
    input supply1 id_1,
    input tri1 id_2,
    output wire id_3,
    output wire id_4,
    input supply1 id_5,
    input tri id_6,
    output tri id_7,
    input supply0 id_8,
    input uwire id_9
);
  generate
    if (1) begin
      id_11(
          .id_0(1), .id_1(id_8), .id_2(id_4), .id_3(id_3), .id_4(1), .id_5(1), .id_6(1), .id_7(1)
      );
    end else begin : id_12
      wire id_13;
      assign id_0 = 1'b0;
    end
  endgenerate
  module_0(
      id_2, id_6, id_4, id_9, id_4, id_6, id_1, id_1, id_0, id_1, id_4
  );
endmodule

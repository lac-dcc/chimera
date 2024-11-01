// Seed: 1443686852
module module_0 (
    input  tri0 id_0,
    input  tri  id_1,
    output tri1 id_2,
    input  tri0 id_3
);
  generate
    for (id_5 = id_0; id_1; id_2 = id_1) begin : id_6
      id_7(
          .id_0(1'b0 <= 1'h0), .id_1(id_6), .id_2(1), .id_3(id_1(1, 1)), .id_4(1'd0)
      );
    end
  endgenerate
endmodule
module module_1 (
    input  wire  id_0,
    output logic id_1,
    output wor   id_2,
    input  logic id_3
);
  assign id_2 = 1;
  assign id_1 = id_3;
  module_0(
      id_0, id_0, id_2, id_0
  );
  reg id_5;
  reg id_6;
  initial begin
    repeat (id_5) begin
      wait (id_0);
      id_1 <= id_0 * 1'b0 - 1;
    end
    #1;
    id_6 <= id_5;
    id_1 <= 1;
    if (id_6) id_5 <= 1;
    else id_1 = id_6 * id_0 * id_6 + id_0;
  end
endmodule

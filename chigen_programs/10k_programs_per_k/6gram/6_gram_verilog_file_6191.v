// Seed: 340765243
module module_0 (
    input supply1 id_0,
    input supply0 id_1,
    output supply0 id_2,
    input wor id_3,
    output wor id_4,
    input uwire id_5,
    input wor id_6,
    input tri1 id_7,
    output supply0 id_8
);
  wire id_10;
  always @(1'b0 - id_7 / 1 or 1) begin
    if (id_3) begin
      if (1 && 'b0 == 1) begin
        disable id_11;
        id_2 = id_1;
      end else begin
        disable id_12;
      end
    end
  end
endmodule
module module_1 (
    input supply0 id_0,
    output tri id_1
);
  logic [7:0] id_3;
  module_0(
      id_0, id_0, id_1, id_0, id_1, id_0, id_0, id_0, id_1
  );
  uwire id_4, id_5, id_6, id_7, id_8 = !id_3[1], id_9, id_10 = 1;
endmodule

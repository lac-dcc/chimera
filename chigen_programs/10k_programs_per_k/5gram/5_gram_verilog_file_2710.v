// Seed: 1561755547
module module_0;
  always @(1) begin
    if (1) id_1 <= 1;
    else begin
      #1 begin
        id_1 <= id_1 & id_1;
      end
    end
  end
  integer id_3;
endmodule
module module_1 (
    output uwire id_0,
    output uwire id_1
    , id_10,
    output wand id_2,
    output wire id_3,
    output tri id_4,
    input uwire id_5,
    input wand id_6,
    input supply1 id_7,
    input supply1 id_8
);
  wire id_11;
  module_0(); id_12(
      .id_0(id_4), .sum(1), .id_1(1), .id_2(1)
  );
endmodule

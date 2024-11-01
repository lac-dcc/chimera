// Seed: 4250383834
module module_0 (
    input supply1 id_0,
    input wand id_1,
    input wand id_2,
    output wand id_3,
    output uwire id_4,
    output supply0 id_5,
    input supply0 id_6,
    output tri id_7,
    input tri id_8,
    input tri0 id_9,
    output wor id_10,
    input wand id_11,
    input uwire id_12,
    input tri0 id_13
    , id_15
);
  wire id_16;
endmodule
module module_1 (
    input uwire id_0,
    input uwire id_1,
    output tri id_2,
    input tri id_3,
    input supply1 id_4,
    output supply0 id_5,
    input wire id_6,
    output uwire id_7,
    input wor id_8,
    input wor id_9,
    input uwire id_10,
    input uwire id_11,
    input tri id_12,
    output logic id_13
);
  module_0(
      id_8, id_10, id_6, id_7, id_5, id_2, id_6, id_5, id_4, id_3, id_5, id_3, id_4, id_3
  );
  assign id_2 = !id_11;
  always @(id_0 or 1) begin
    if (1) begin
      while (id_8) begin
        id_5 = id_11;
        id_5 = 1;
      end
    end else begin
      id_13 <= 1 ? 1'b0 : 1'b0 + 1;
    end
  end
endmodule

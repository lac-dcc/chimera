// Seed: 443516168
module module_0 (
    input tri id_0,
    output wor id_1,
    output uwire id_2,
    input wor id_3,
    input supply0 id_4,
    output tri id_5,
    output tri id_6
);
  assign id_6 = id_3;
endmodule
module module_1 (
    output supply1 id_0,
    output supply0 id_1,
    input supply0 id_2,
    input wor id_3,
    output wor id_4,
    output uwire id_5,
    input wor id_6,
    input supply0 id_7,
    output logic id_8,
    output wor id_9,
    input wand id_10,
    input wor id_11
    , id_14,
    output supply0 id_12
);
  always @* begin
    if (id_2) begin
      #1;
      fork
        id_15(~id_2, 1);
        begin
          id_14 <= id_14 == id_6 + 1;
          id_8  <= 1;
        end
      join : id_16
    end
  end
  xor (id_4, id_10, id_7, id_3, id_2);
  module_0(
      id_3, id_4, id_12, id_7, id_3, id_9, id_4
  );
endmodule

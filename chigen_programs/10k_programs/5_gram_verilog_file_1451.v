// Seed: 536844947
module module_0 (
    output wor  id_0,
    output tri1 id_1,
    input  tri0 id_2
);
  uwire id_4 = 1;
  id_5(
      .id_0(1), .id_1(1'h0), .id_2(1), .id_3(id_0 & id_1), .id_4(1), .id_5(id_0), .id_6(), .id_7()
  );
endmodule
module module_1 (
    output logic id_0,
    output wor id_1,
    input wor id_2,
    input supply0 id_3,
    output logic id_4,
    output wand id_5
);
  always @(negedge 1) begin
    if (id_2 && id_2 && id_2) begin
      if (1'b0 == id_3) id_4 <= 1;
      else id_0 <= #id_2 1;
    end
  end
  module_0(
      id_1, id_5, id_2
  );
endmodule

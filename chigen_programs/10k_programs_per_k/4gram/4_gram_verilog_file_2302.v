// Seed: 2692546866
module module_0;
  assign id_1 = 1 ? id_1 : ~1;
endmodule
module module_1 #(
    parameter id_6 = 32'd92,
    parameter id_7 = 32'd49
) (
    input supply0 id_0,
    input supply1 id_1,
    input tri id_2
);
  assign id_4 = 1'b0;
  id_5(
      .id_0(1), .id_1(1'b0), .id_2(1), .id_3(1 - id_0)
  );
  if (id_5) begin
    assign id_4 = 1;
  end else begin
    defparam id_6.id_7 = 1;
  end
  always force id_4 = id_4;
  module_0();
endmodule

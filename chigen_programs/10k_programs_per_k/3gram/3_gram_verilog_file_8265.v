// Seed: 643515082
module module_0;
  always_ff #(id_1) begin
    id_1 = {1{1}};
    if (1'h0 - 1) begin
      id_1 <= (~1);
      id_1 = #1 id_1;
    end else id_1 = 1;
  end
  module_2();
endmodule
module module_1 (
    input  wire id_0,
    output tri  id_1,
    input  tri0 id_2,
    input  tri  id_3
);
  assign id_1 = 1;
  module_0();
endmodule
module module_2;
  id_1(
      .id_0(id_2), .id_1(), .id_2(id_2 - 1), .id_3(1)
  );
endmodule

// Seed: 2280183502
module module_0;
  wire id_2;
  tri  id_3 = id_1;
  always_ff @(posedge id_1 or posedge id_2);
  assign id_3 = 1;
  assign id_3 = 1;
endmodule
module module_1;
  always @* begin
    if (1) id_1 = id_1 * id_1 - 1;
    $display(id_1);
    if (1) begin
      if (id_1) begin
        if (id_1) begin
          id_1 <= 1;
        end else id_1 = id_1;
      end else id_1 = #1 id_1;
    end
    id_1 <= id_1;
  end
  module_0();
endmodule

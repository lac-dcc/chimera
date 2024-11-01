// Seed: 3116536057
module module_0 (
    output supply0 id_0,
    output supply0 id_1,
    input wor id_2,
    output tri1 id_3
);
  id_5(
      .id_0(1'h0 - id_0), .id_1(1), .id_2(id_0), .id_3(1), .id_4(id_6), .id_5(id_6), .id_6(1)
  );
  initial $display;
endmodule
module module_1 (
    output tri id_0,
    input supply0 id_1,
    output logic id_2,
    output supply0 id_3,
    input wire id_4,
    output wire id_5
);
  supply1 id_7 = id_1;
  module_0(
      id_3, id_5, id_7, id_0
  );
  always @(1 or id_7 ==? id_1) begin
    if (1 == id_7) begin
      disable id_8;
    end else begin
      id_2 <= 1'b0;
    end
  end
endmodule

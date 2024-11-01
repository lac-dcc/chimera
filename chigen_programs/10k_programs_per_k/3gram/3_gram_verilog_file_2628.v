// Seed: 1575358256
module module_0 (
    output tri id_0,
    input tri1 id_1,
    input wor id_2,
    output tri id_3,
    input supply1 id_4,
    output supply0 id_5,
    input supply1 id_6
);
  always @(1'd0 or posedge 1) begin
    id_3 = id_4 & id_2;
    if (1'b0) begin
      cover (1);
    end
  end
  assign id_3 = 1 <= id_2;
  assign id_3 = 1 << 1;
endmodule
module module_1 (
    input wand id_0,
    input wor id_1,
    output wire id_2,
    output wire id_3,
    output logic id_4,
    input supply0 id_5,
    input wand id_6
);
  logic id_8;
  always_comb @(negedge id_0) begin
    id_8 <= 1;
    id_3 = 1;
    id_8 <= 1'h0;
    id_8 = 1;
    $display(1, id_0 >= 1);
    $display(id_5);
    id_4 = 1;
    id_2 = id_1;
    id_3 = id_1;
    id_4 <= 1;
    id_4 <= #1 1;
    if (id_8)
      forever begin
        id_2#(.id_1(1'h0)) = 1;
      end
  end
  module_0(
      id_2, id_5, id_5, id_2, id_6, id_3, id_5
  );
  wire id_9;
  assign id_4#(.id_1(1'h0)) = id_8;
endmodule

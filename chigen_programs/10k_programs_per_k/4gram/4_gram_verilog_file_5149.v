// Seed: 2472613812
module module_0 (
    output tri id_0,
    input supply0 id_1,
    input tri id_2,
    input tri1 id_3,
    output supply0 id_4,
    output tri0 module_0
);
endmodule
module module_1 (
    output tri1 id_0,
    output wor id_1,
    input tri id_2,
    input wand id_3,
    input supply1 id_4,
    input wand id_5
);
  generate
    initial begin
      #1 begin
        $display(1, 1'd0);
      end
      id_1 = 1;
    end
    assign id_0 = id_3;
  endgenerate
  module_0(
      id_1, id_5, id_2, id_3, id_0, id_1
  );
endmodule

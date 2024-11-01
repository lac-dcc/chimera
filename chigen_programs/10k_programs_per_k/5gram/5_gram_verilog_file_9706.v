// Seed: 787263680
module module_0 (
    output wor id_0,
    output tri0 id_1,
    input uwire id_2,
    output wand id_3,
    input tri1 id_4,
    input wire id_5,
    input supply0 id_6,
    input tri1 id_7,
    input wand id_8
);
  generate
    always @(1 or id_8) begin
      for (id_3 = id_8; 1; id_0 = 1) begin
        if (1 || id_7) #1;
      end
      id_3 = id_5;
    end
  endgenerate
endmodule
module module_1 (
    input wor id_0,
    output tri id_1,
    input supply1 id_2,
    input tri1 id_3,
    input tri id_4,
    output wand id_5,
    input supply1 id_6
);
  always @(id_4 or posedge id_2) begin
    if (id_3) assert (id_0);
  end
  module_0(
      id_5, id_5, id_6, id_1, id_3, id_0, id_6, id_0, id_2
  );
endmodule

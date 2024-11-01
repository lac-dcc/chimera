// Seed: 4051427279
module module_0 (
    input  tri1 id_0,
    output wand id_1,
    input  tri0 id_2,
    output wand id_3
);
endmodule
module module_1 (
    input  wor   id_0,
    input  tri   id_1,
    input  tri1  id_2,
    input  tri1  id_3,
    input  uwire id_4,
    output tri   id_5
);
  assign id_5 = 1;
  module_0(
      id_2, id_5, id_2, id_5
  );
endmodule
module module_2 (
    output logic id_0,
    input  wire  id_1,
    input  tri0  id_2,
    input  tri   id_3,
    input  uwire id_4,
    output wor   id_5
);
  always @(negedge 1'd0) begin
    fork
      @(posedge 1)
      if (id_4) begin
        #1;
        begin
          $display(1 == (id_4));
          id_0 <= 1;
        end
      end
      id_7.id_8(1);
    join
  end
  module_0(
      id_2, id_5, id_2, id_5
  );
endmodule

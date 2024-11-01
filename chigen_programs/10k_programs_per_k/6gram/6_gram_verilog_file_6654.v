// Seed: 2376538965
module module_0 (
    input wand id_0,
    input tri  id_1,
    input tri0 id_2
);
  supply1 id_4;
  assign id_4 = 1;
endmodule
module module_1 (
    input  tri1 id_0,
    input  wire id_1,
    output tri0 id_2,
    output wire id_3,
    input  tri  id_4,
    inout  tri0 id_5,
    input  tri  id_6,
    input  wand id_7,
    output tri  id_8
);
  generate
    if (id_1) begin
      assign id_2 = id_0;
    end else if (1) begin : id_10
      always @(posedge id_6) begin
        fork
          repeat (id_10 - 1'd0) begin
            id_8 = 1;
          end
        join
      end
    end
  endgenerate
  module_0(
      id_0, id_1, id_1
  );
endmodule

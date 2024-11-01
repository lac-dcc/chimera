// Seed: 428373773
module module_0;
  assign id_1 = 1 ? 1 : id_1 ? id_1 : id_1;
  reg id_2;
  initial begin
    id_2 <= id_1;
    repeat (1 <= id_1) begin
      id_1 <= id_1 ? id_1 : id_2;
      fork
        begin
          id_2 = 1'b0;
        end
        repeat (id_1[1'h0]) begin
          id_1 = id_2;
        end
      join
    end
  end
endmodule
module module_1 (
    input  wand  id_0,
    input  tri   id_1,
    output tri1  id_2,
    input  wor   id_3
    , id_6,
    input  logic id_4
);
  wor id_7 = id_7;
  assign id_7 = id_0;
  always @(id_7 or 1) begin
    id_6 <= id_4;
  end
  module_0();
endmodule

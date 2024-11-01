// Seed: 642672892
module module_0 (
    input  uwire id_0,
    output wor   id_1,
    input  wand  id_2,
    input  tri   id_3,
    input  wand  id_4,
    output wor   id_5
);
  wire id_7, id_8, id_9 = (1 && {id_4{1}} == id_7 < 1);
endmodule
module module_1 (
    input tri id_0,
    input tri0 id_1,
    output tri id_2,
    input wire id_3,
    input wire id_4,
    output wand id_5,
    input tri1 id_6
    , id_13,
    input tri1 id_7,
    input tri0 id_8,
    output wand id_9,
    input supply1 id_10,
    output tri id_11
);
  wire id_14;
  wor  id_15;
  assign id_2 = 1 ? id_15 : 1;
  module_0(
      id_8, id_11, id_4, id_4, id_4, id_2
  );
  always @(posedge id_8 or 1) begin
    disable id_16;
    $display(id_14);
  end
  always @(*) begin
    if (id_7 | id_0) begin
      fork
        begin
          wait (1);
          id_11 = id_4;
        end
        begin
          deassign id_11;
        end
      join
    end else begin
      id_13 <= id_14 & id_8 & id_4 - 1'b0;
    end
  end
endmodule

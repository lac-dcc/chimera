// Seed: 3597001556
module module_0 (
    output wand  id_0,
    output uwire id_1,
    input  uwire id_2,
    input  tri   id_3,
    input  tri1  id_4
);
  function real id_6;
    integer id_7, id_8;
    reg id_9;
    begin
      id_0 = id_7;
      `define pp_10 0
      if (1 == id_4 * id_8) begin
        id_9 <= 1;
      end
    end
  endfunction
endmodule
module module_1 (
    input  tri1 id_0,
    input  wor  id_1,
    output tri0 id_2
);
  assign id_2 = 1'b0;
  assign id_2 = id_0;
  module_0(
      id_2, id_2, id_1, id_0, id_1
  );
endmodule

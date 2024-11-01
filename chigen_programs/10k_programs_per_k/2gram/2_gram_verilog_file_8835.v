// Seed: 3280336223
module module_0 ();
  supply0 id_1 = 1;
endmodule
module module_1 (
    input  wor   id_0,
    output wire  id_1,
    input  logic id_2,
    output wire  id_3,
    input  tri0  id_4,
    input  logic id_5,
    input  wire  id_6,
    output tri1  id_7
);
  function id_9;
    output id_10, id_11, id_12;
    begin : id_13
      id_10 <= 1;
    end
  endfunction
  module_0(); id_14 :
  assert property (@(posedge id_10 or posedge id_5) id_2)
  else id_14 = id_9#(.id_5(1));
  wire id_15;
endmodule

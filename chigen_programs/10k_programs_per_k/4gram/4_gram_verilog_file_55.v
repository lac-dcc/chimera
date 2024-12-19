// Seed: 2863554390
module module_0 (
    output tri0 id_0,
    output tri id_1,
    input supply0 id_2,
    output supply0 id_3,
    output tri0 id_4,
    output wor id_5,
    output wor id_6,
    input supply0 id_7
);
  function id_9(input id_10);
    id_5 = 1;
  endfunction
  wire id_11;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    input  wor  id_0,
    input  tri1 id_1,
    output tri  id_2,
    input  tri0 id_3,
    input  tri  id_4,
    input  wire id_5
);
  assign id_2 = 1;
  always_ff @(~id_4, "") begin : LABEL_0
    do begin : LABEL_0
      #1;
    end while (id_5);
  end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_2,
      id_4
  );
endmodule

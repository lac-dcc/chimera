// Seed: 1267038051
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    input wor id_2
);
  wire id_4;
  module_2();
endmodule
module module_1 (
    output wor  id_0,
    input  tri  id_1,
    output wand id_2
);
  assign id_0 = id_1 ? id_1 : id_1;
  module_0(
      id_1, id_1, id_1
  );
  wire id_4;
endmodule
module module_2;
  always_latch @(id_1 or posedge 1) #0 id_1 = id_1;
  reg id_2;
  function id_3(input integer id_4, input id_5, input id_6, input id_7 = id_7, output id_8,
                input id_9, input id_10, input integer id_11, input reg id_12);
    begin
      id_3 <= 1;
      begin
        id_8 <= (id_6 | 1) & 1;
        id_3 = 1;
        id_2 <= 1;
        cover (1);
      end
    end
  endfunction
  always @(posedge 1 == id_5) id_11 = id_4;
  wire id_13;
  wire id_14;
  assign id_3 = 1;
endmodule

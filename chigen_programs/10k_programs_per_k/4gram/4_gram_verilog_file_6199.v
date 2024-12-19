// Seed: 1085838807
module module_0;
  supply1 id_2;
  assign id_2 = 1;
  function id_3;
    input id_4;
    input id_5;
    byte id_6;
    input id_7;
    input id_8;
    input id_9;
    input integer id_10;
    input id_11;
    input id_12;
    begin : LABEL_0$display
      ;
      id_6 = 1'b0;
    end
  endfunction
endmodule
module module_1;
  always repeat (id_1) id_1 = 1;
  module_0 modCall_1 ();
  wire id_2;
  id_3(
      .id_0(1), .id_1(1), .id_2(id_1)
  );
endmodule
module module_2 ();
  integer id_1;
  module_0 modCall_1 ();
endmodule

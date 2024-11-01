// Seed: 1591976891
module module_0 (
    input uwire id_0,
    input uwire id_1,
    input uwire id_2,
    input supply0 id_3,
    input wand id_4,
    input uwire id_5,
    output uwire id_6
);
  assign id_6 = id_2;
  id_8(
      .id_0(1), .id_1((id_6)), .id_2(1), .id_3(!id_0), .id_4(1)
  );
  assign id_6 = 1'd0;
  tri id_9;
  function id_10;
    input id_11;
    input id_12;
    id_11 = id_5;
  endfunction
  assign id_9 = 1'b0;
  wire id_13 = 1;
endmodule
module module_1 (
    output wand id_0,
    input wand id_1,
    output tri id_2,
    input tri id_3,
    input supply1 id_4,
    output supply0 id_5,
    input supply0 id_6,
    input wand id_7,
    output wand id_8,
    input wand id_9,
    input wire id_10,
    output wire id_11
);
  id_13(
      .id_0(1'h0), .id_1(id_0), .id_2(id_1), .id_3(1'h0), .id_4()
  ); module_0(
      id_7, id_7, id_1, id_3, id_1, id_9, id_8
  );
endmodule

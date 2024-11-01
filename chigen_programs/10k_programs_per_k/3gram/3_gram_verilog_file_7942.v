// Seed: 2748813487
module module_0 (
    input wor id_0,
    output uwire id_1,
    output supply0 id_2,
    input tri1 id_3,
    input wor id_4,
    input tri1 id_5,
    output supply0 id_6,
    input supply0 id_7,
    inout uwire id_8,
    output wor id_9,
    input uwire id_10,
    input tri0 id_11,
    input wand id_12,
    input wor id_13,
    output supply1 id_14,
    input tri0 id_15,
    input tri0 id_16,
    input tri0 id_17,
    output wor id_18,
    output tri1 id_19,
    input wor id_20,
    input supply1 id_21,
    input wor id_22,
    input tri1 id_23,
    input tri1 id_24,
    input tri id_25,
    input wor id_26,
    input tri id_27,
    output supply1 id_28,
    input wor id_29,
    output uwire id_30,
    output supply1 id_31,
    input wor id_32,
    input tri1 id_33,
    output uwire id_34,
    input tri id_35,
    input supply1 id_36
);
  tri0 id_38 = 1'b0;
endmodule
module module_1 (
    input supply0 id_0,
    output wor id_1,
    input supply0 id_2,
    output tri1 id_3
);
  assign id_3 = id_2;
  tri1 id_5;
  wire id_6;
  wor  id_7 = (id_5) + 1, id_8;
  assign id_7 = id_5;
  id_9(
      .id_0(id_1), .id_1(id_3), .id_2(1), .id_3(id_1)
  );
  function id_10;
    reg id_11;
    begin
      id_11 <= 1;
      @(*);
    end
  endfunction
  wire id_12;
  wire id_13;
  wire id_14;
  supply0 id_15 = id_0;
  wire id_16;
  module_0(
      id_15,
      id_1,
      id_1,
      id_2,
      id_0,
      id_2,
      id_3,
      id_0,
      id_15,
      id_15,
      id_2,
      id_0,
      id_15,
      id_15,
      id_1,
      id_2,
      id_0,
      id_2,
      id_1,
      id_1,
      id_2,
      id_15,
      id_15,
      id_2,
      id_15,
      id_0,
      id_0,
      id_2,
      id_15,
      id_0,
      id_3,
      id_3,
      id_15,
      id_0,
      id_3,
      id_2,
      id_2
  );
  wire id_17;
endmodule

// Seed: 480427979
module module_0 (
    input wand id_0,
    output supply1 id_1,
    input supply1 id_2,
    input supply0 id_3,
    input supply1 id_4,
    input tri id_5,
    input wor id_6,
    input tri1 id_7,
    output supply0 id_8,
    input wor id_9,
    input wire id_10,
    input wand id_11,
    output tri id_12,
    output uwire id_13,
    output uwire id_14,
    input wor id_15,
    input wor id_16,
    input uwire id_17,
    input tri id_18
    , id_21,
    input wand id_19
);
  supply1 id_22;
  assign id_12 = id_22 && 1;
endmodule
module module_1 (
    input wor id_0,
    output logic id_1,
    input supply0 id_2,
    input tri1 id_3,
    output supply1 id_4,
    output wor id_5
);
  assign id_5 = id_2;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_2,
      id_3,
      id_0,
      id_3,
      id_3,
      id_3,
      id_5,
      id_3,
      id_3,
      id_0,
      id_5,
      id_5,
      id_4,
      id_0,
      id_0,
      id_3,
      id_2,
      id_3
  );
  id_7(
      .id_0(id_3)
  );
  wire id_8, id_9;
  wire id_10, id_11;
  buf primCall (id_4, id_2);
  function id_12;
    output id_13;
    input id_14 = 1;
    id_1 <= #1 1;
  endfunction
endmodule

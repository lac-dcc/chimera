// Seed: 2003127854
module module_0 (
    output supply1 id_0,
    output tri0 id_1,
    output supply0 id_2,
    input tri id_3,
    input tri1 id_4,
    input tri0 id_5,
    output uwire id_6,
    input tri1 id_7,
    output tri0 id_8,
    input supply1 id_9,
    input wor id_10,
    input tri1 id_11,
    output supply1 id_12,
    input wand id_13,
    output tri1 id_14,
    input supply0 id_15,
    input wire id_16
);
  wire id_18;
endmodule
module module_1 (
    input logic id_0,
    input wor id_1,
    output logic id_2,
    output tri id_3,
    output tri1 id_4,
    input supply0 id_5,
    output tri0 id_6,
    input tri0 id_7
);
  reg id_9;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_1,
      id_5,
      id_5,
      id_6,
      id_1,
      id_3,
      id_7,
      id_1,
      id_5,
      id_3,
      id_1,
      id_3,
      id_1,
      id_7
  );
  assign modCall_1.id_11 = 0;
  assign id_2 = id_0;
  function automatic id_10;
    integer id_11;
    begin : LABEL_0
      id_2 <= id_9;
    end
  endfunction
  id_12(
      .id_0(1'b0), .id_1(id_3 == 1), .id_2(1), .id_3(1)
  );
endmodule

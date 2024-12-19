// Seed: 1678959192
module module_0 (
    input wand id_0,
    input tri1 id_1,
    input supply0 id_2,
    input tri0 id_3,
    input wor id_4
    , id_30,
    input supply1 id_5,
    output wire id_6,
    input wor id_7,
    input tri0 id_8,
    input wire id_9,
    input wire id_10,
    input wire id_11,
    input wire id_12
    , id_31,
    input tri0 id_13,
    input uwire id_14,
    input wor id_15,
    output tri0 id_16,
    input supply0 id_17,
    input supply0 id_18,
    output supply1 id_19,
    input supply1 id_20,
    input wire id_21,
    input uwire id_22,
    input uwire id_23,
    input tri id_24,
    input tri id_25,
    output tri0 id_26,
    output tri1 id_27,
    input tri0 id_28
);
  reg id_32;
  function id_33;
    input id_34;
    if (id_33)
      if (1 === id_3) id_19 = id_24;
      else id_32 <= id_22 & 1;
  endfunction
  assign module_1.type_6 = 0;
  tri0 id_35 = id_10;
  wire id_36;
endmodule
module module_1 #(
    parameter id_2 = 32'd43
) (
    output uwire id_0,
    input  tri0  id_1,
    input  wand  _id_2
);
  reg id_4;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_1
  );
  always @(negedge id_4) begin : LABEL_0
    #1
    repeat (id_4[{
      1, id_2
    }]) begin : LABEL_0
      id_4 <= 1'd0;
    end
  end
endmodule

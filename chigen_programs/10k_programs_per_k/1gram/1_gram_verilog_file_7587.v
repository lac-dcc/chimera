// Seed: 692999252
module module_0 (
    input wor id_0,
    output supply1 id_1,
    input tri0 id_2
    , id_9,
    input supply1 id_3,
    output wand id_4,
    input wor id_5,
    output wor id_6,
    output uwire id_7
);
  assign id_4 = 1;
endmodule
module module_1 (
    output wand id_0,
    input tri1 id_1,
    input uwire id_2,
    input wor id_3,
    input supply1 id_4,
    output logic id_5,
    input supply0 id_6,
    output logic id_7,
    input logic id_8,
    input tri0 id_9,
    input wire id_10,
    output wire id_11,
    input tri0 id_12,
    input wire id_13,
    input wire id_14,
    input tri0 id_15,
    input wire id_16,
    input wor id_17,
    output supply0 id_18,
    input supply0 id_19,
    input supply1 id_20,
    output supply1 id_21
);
  wire id_23 = id_23;
  logic [7:0] id_24;
  wire id_25;
  wire id_26, id_27;
  wire  id_28;
  uwire id_29;
  uwire id_30 = id_4;
  assign id_29 = id_3;
  tri id_31, id_32;
  module_0(
      id_4, id_0, id_29, id_6, id_11, id_30, id_18, id_30
  );
  assign id_11 = !id_31;
  function id_33(output id_34, input id_35);
    id_7 <= id_1 == 1;
    #1 id_34 = 1;
    id_33 <= id_8;
    begin
      @(posedge 1 + 1) id_26 = 1;
    end
    id_26 = id_31;
    begin
      if (~id_24[1'b0+:1] !== 1'h0)
        fork
          if (1'b0) id_5 <= 1 - 1;
        join
      else return id_24;
    end
  endfunction
endmodule

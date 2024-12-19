// Seed: 1909692399
module module_0 (
    input tri0 id_0,
    input tri1 id_1,
    output tri id_2,
    inout supply0 id_3,
    input supply1 id_4,
    input tri0 id_5,
    output wire id_6
);
  wire id_8;
  function int id_9;
    input id_10;
    input id_11;
    begin : LABEL_0
      id_3 = 1 * 1;
    end
  endfunction
  assign module_1.id_33 = 0;
  wire id_12;
  assign id_9 = 1;
endmodule
module module_1 (
    input logic id_0,
    output supply1 id_1,
    input tri id_2,
    output tri id_3,
    input uwire id_4,
    output supply1 id_5,
    output supply1 id_6,
    input tri1 id_7,
    input tri id_8,
    input wire id_9,
    input wand id_10
    , id_30,
    output tri0 id_11,
    input uwire id_12,
    input uwire id_13,
    output supply1 id_14,
    input wand id_15,
    input uwire id_16,
    inout logic id_17,
    input tri id_18
    , id_31,
    output supply0 id_19,
    output wor id_20,
    input wire id_21,
    output supply0 id_22,
    input tri1 id_23,
    input logic id_24,
    input wand id_25,
    input uwire id_26,
    output wor id_27,
    input tri1 id_28
);
  id_32 :
  assert property (@(posedge {id_2{1}}) 1)
  else $display;
  reg id_33;
  module_0 modCall_1 (
      id_4,
      id_32,
      id_5,
      id_32,
      id_9,
      id_10,
      id_19
  );
  always_comb
    if (id_21) begin : LABEL_0
      begin : LABEL_0
        wait (id_15);
        force id_32 = 1;
      end
    end else if (id_4) id_33 <= id_24;
    else begin : LABEL_0
      id_17 <= id_0;
    end
endmodule

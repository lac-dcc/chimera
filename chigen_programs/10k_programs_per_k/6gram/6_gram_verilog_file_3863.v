// Seed: 2523481369
module module_0 (
    input tri   id_0,
    input wor   id_1,
    input wor   id_2,
    input uwire id_3
    , id_5
);
  assign id_5 = 1 == 1;
  assign id_5 = 1;
  wire id_6;
  assign module_1.id_14 = 0;
  wire id_7;
  wire id_8, id_9, id_10, id_11, id_12, id_13;
  assign id_5 = 1;
endmodule
module module_1 (
    input logic id_0,
    output logic id_1,
    input supply1 id_2,
    output wor id_3,
    input tri id_4,
    input uwire id_5,
    output tri0 id_6
    , id_21,
    input tri id_7,
    output logic id_8,
    output logic id_9,
    output supply1 id_10,
    input logic id_11
    , id_22,
    input supply0 id_12,
    output logic id_13,
    output logic id_14,
    input wor id_15,
    input wire id_16,
    output wand id_17,
    input tri0 id_18,
    output wand id_19
    , id_23
);
  reg  id_24;
  wire id_25;
  module_0 modCall_1 (
      id_18,
      id_5,
      id_18,
      id_15
  );
  function id_26;
    input id_27;
    if (id_25 < "") id_13 <= 1;
    else begin : LABEL_0
      id_27 <= 1;
      id_6 = 1;
      if (id_23) begin : LABEL_0
        fork
          begin : LABEL_0
            disable id_28;
            id_9 <= #id_18 id_12 | 1'b0;
            id_8 = #id_29 1;
          end
        join
      end else begin : LABEL_0
        id_9  <= id_11;
        id_24 <= id_21;
        id_14 <= id_0;
        disable id_30;
        id_1 <= 1;
      end
    end
  endfunction
  wire id_31;
endmodule

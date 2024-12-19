// Seed: 846765930
module module_0;
  wire id_2;
  timeunit 1ps;
  wire id_3;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_2 = {id_2, 1'b0, 1, 1, 1'b0 + 1};
  assign id_3 = 1 + id_2 ? 1 : 1;
  module_0 modCall_1 ();
  wire id_6;
endmodule
module module_2 (
    input tri id_0,
    input wand id_1,
    output logic id_2,
    output wire id_3,
    input uwire id_4,
    output tri1 id_5,
    output logic id_6,
    output uwire id_7,
    input tri0 id_8,
    input wor id_9,
    output tri0 id_10,
    output logic id_11,
    input tri0 id_12,
    input wand id_13,
    input supply0 id_14,
    output wor id_15,
    input tri1 id_16,
    input tri id_17,
    output supply0 id_18,
    output wire id_19,
    input tri0 id_20,
    input wor id_21,
    input wand id_22,
    input tri0 id_23,
    output supply1 id_24,
    input tri1 id_25,
    input tri0 id_26,
    input tri1 id_27,
    input wor id_28,
    output tri0 id_29
);
  initial begin : LABEL_0
    begin : LABEL_0
      if (1) begin : LABEL_0
        id_19 = 1'd0;
        if (id_8) begin : LABEL_0
          id_2 <= 1;
        end else begin : LABEL_0
          if (id_26) begin : LABEL_0
            assert (1);
          end else begin : LABEL_0
            id_29 = 1;
          end
        end
      end
    end
    if (id_17) id_6 <= {1, id_8} != 1;
    else id_11 <= 1;
  end
  module_0 modCall_1 ();
endmodule

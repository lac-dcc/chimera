// Seed: 3576343346
module module_0 (
    input wor id_0,
    output tri0 id_1,
    input tri0 id_2,
    output wire id_3,
    input wire id_4,
    output wire id_5,
    input wire id_6,
    id_13,
    input supply1 id_7,
    input wor id_8,
    input supply1 id_9,
    id_14,
    input wand id_10,
    input wor id_11
);
  wor  id_15 = id_13;
  wire id_16;
  assign module_1.id_20 = 0;
  assign id_13 = 1;
  uwire id_17, id_18, id_19, id_20, id_21, id_22;
  generate
    begin : LABEL_0
      begin : LABEL_0
        assign id_17 = id_9;
        wire id_23, id_24;
        assign id_14 = id_18;
        begin : LABEL_0
          assign id_19 = id_0;
        end
      end
    end
    tri0 id_25 = id_7;
  endgenerate
  assign id_18 = id_17;
  assign id_3  = id_4;
endmodule
module module_1 (
    output logic id_0,
    input  logic id_1,
    output tri0  id_2,
    output logic id_3,
    output logic id_4,
    input  tri0  id_5,
    input  logic id_6
);
  assign id_4 = id_1;
  always
    case (1'b0)
      "": id_3 <= id_6;
      1: begin : LABEL_0
        begin : LABEL_0
          id_3 = 1;
        end
      end
    endcase
  assign id_4 = -1;
  always id_4 <= -1'h0;
  logic id_8;
  id_9(
      id_8, -1,, 1 ? id_3 : id_10, ~id_5
  );
  tri1 id_11;
  always begin : LABEL_0
    id_0 <= | -1;
    begin : LABEL_0$display
      ;
      id_8 <= 1;
    end
  end
  tri0 id_12 = {1 - id_11};
  logic id_13, id_14 = id_8;
  assign id_12 = -1;
  wire id_15;
  assign id_4 = -1;
  logic id_16, id_17, id_18, id_19, id_20 = id_1, id_21, id_22, id_23, id_24, id_25;
  logic id_26;
  module_0 modCall_1 (
      id_5,
      id_2,
      id_5,
      id_2,
      id_5,
      id_2,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5
  );
  assign id_24 = id_26;
  assign id_4  = -1 == id_22;
endmodule

// Seed: 919523711
module module_0 (
    output logic id_0,
    input wor id_1,
    input supply0 id_2,
    input wire id_3,
    output tri id_4,
    input tri id_5,
    input tri id_6,
    input tri0 id_7,
    output logic id_8,
    input uwire id_9,
    output wand id_10
    , id_19,
    input wand id_11,
    output logic id_12,
    input uwire id_13,
    input wire id_14,
    input wor id_15,
    input supply1 id_16,
    output tri0 id_17
);
  id_20 :
  assert property (@(negedge -1) -1 * 1)
  else id_19[-1] <= 1;
  always @* begin : LABEL_0
    if (1) begin : LABEL_1
      id_8 <= id_15;
      id_8 <= id_11;
    end else begin : LABEL_2
      id_20 = id_13 & -1'd0 & -1 == -1'b0;
      id_0 <= 1;
    end
  end
  always @(posedge 1 or posedge id_16) begin : LABEL_3
    id_12 <= 1;
  end
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    input uwire id_0,
    input supply0 id_1,
    input uwire id_2,
    input uwire id_3,
    input wor id_4,
    output logic id_5,
    output logic id_6,
    output tri id_7,
    output tri id_8,
    input supply1 id_9,
    output wire id_10,
    input wire id_11,
    output logic id_12,
    input tri1 id_13
);
  always id_12 = #id_15 -1;
  assign id_12 = 1;
  always @(posedge -1'b0);
  wire id_16;
  wire id_17;
  always @*
    if (1) begin : LABEL_0
      id_6 <= id_17 | id_0 | 1;
    end else id_5 = id_9;
  logic [1 : -1] id_18;
  wire id_19;
  module_0 modCall_1 (
      id_5,
      id_13,
      id_1,
      id_9,
      id_7,
      id_3,
      id_4,
      id_9,
      id_5,
      id_3,
      id_8,
      id_13,
      id_5,
      id_13,
      id_4,
      id_9,
      id_4,
      id_7
  );
endmodule

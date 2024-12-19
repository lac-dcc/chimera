// Seed: 3407057759
module module_0 (
    output supply1 id_0,
    output tri1 id_1,
    input supply1 id_2,
    output wor id_3,
    input wor id_4,
    input uwire id_5,
    output wire id_6,
    input wor id_7,
    input tri id_8,
    input tri0 id_9,
    input uwire id_10,
    input wor id_11,
    output uwire id_12,
    input wire id_13,
    input tri id_14,
    input wand id_15,
    input tri0 id_16,
    input supply1 id_17
    , id_23,
    input tri0 id_18,
    output wor id_19,
    output tri id_20,
    input supply1 id_21
);
  id_24(
      id_0, 1, id_0, id_1
  );
  wire id_25;
  wire id_26;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    input tri id_0,
    input wor id_1,
    input uwire id_2,
    output logic id_3,
    output supply0 id_4,
    input supply0 id_5,
    output logic id_6,
    input wand id_7,
    input logic id_8,
    output supply0 id_9,
    input wand id_10,
    input supply1 id_11,
    output tri1 id_12,
    input wor id_13,
    output supply1 id_14,
    output supply0 id_15,
    input tri1 id_16,
    output supply1 id_17,
    input tri1 id_18,
    input uwire id_19
);
  logic [7:0] id_21;
  always #1 begin : LABEL_0
    if (1)
      if (1)
        if (1) begin : LABEL_0
          id_9 = id_5;
        end
  end
  wire id_22;
  module_0 modCall_1 (
      id_9,
      id_9,
      id_2,
      id_4,
      id_0,
      id_19,
      id_4,
      id_11,
      id_18,
      id_13,
      id_16,
      id_7,
      id_9,
      id_5,
      id_0,
      id_10,
      id_19,
      id_10,
      id_16,
      id_9,
      id_4,
      id_16
  );
  always #(1)
    if (1) begin : LABEL_0
      id_3  = #1 1 | id_1;
      id_12 = id_10;
    end else id_6 <= id_8;
  wire id_23;
  timeunit 1ps / 1ps;
  wire id_24;
  assign id_21[!1'b0] = id_5;
  id_25(
      .id_0(1), .id_1(id_21), .id_2(id_16 - 1), .id_3(1), .id_4(id_9)
  );
endmodule

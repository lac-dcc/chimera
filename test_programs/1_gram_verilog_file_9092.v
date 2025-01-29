// Seed: 2854002943
module module_0 (
    output wor id_0,
    output uwire id_1,
    output wire id_2,
    input uwire id_3,
    input tri id_4,
    output supply1 id_5,
    id_10,
    input uwire id_6,
    id_11,
    input wor id_7,
    input supply0 id_8
);
  assign module_1.type_4 = 0;
  for (id_12 = 1; id_6 + 1'b0; id_1 <<= -1) assign id_1 = -1;
  assign id_10 = id_11;
  wire id_13;
  if (id_6 == -1)
    if (-1) wire id_14, id_15, id_16, id_17, id_18;
    else id_19(1'b0);
  else assign id_18 = id_14;
  wire id_20, id_21;
endmodule
module module_1 (
    output logic id_0,
    output wand  id_1,
    output tri1  id_2,
    input  logic id_3,
    output tri0  id_4,
    input  wand  id_5,
    input  logic id_6,
    output logic id_7,
    output logic id_8,
    output tri0  id_9
);
  assign id_0 = id_6;
  always if (id_3) if (id_6 ? 1 : -1'b0 - 1) id_2 = id_6 || id_6;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_5,
      id_5,
      id_9,
      id_5,
      id_5,
      id_5
  );
  always
    if (id_3) begin : LABEL_0
      id_7 = -1'b0;
      id_0 <= id_3;
      id_7 <= -1;
      id_8 = {id_3, 1};
    end else @(negedge id_6) $display($realtime, -1, id_6);
  for (id_11 = id_6; -1; id_1 = 1 != 1) begin : LABEL_0
    assign id_4 = 1'd0;
  end
  assign id_1 = 1;
endmodule

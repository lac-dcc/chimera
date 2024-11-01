// Seed: 1122732708
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_1 = id_3;
  string id_5 = "";
  string id_6;
  always @(posedge id_1 or posedge id_3)
    if (id_3)
      if (1) begin
        id_4 <= 1;
        id_6 = id_5;
        $display;
      end else id_3 <= 1 == 1;
    else id_2 = 1'b0;
endmodule
module module_1 (
    output wire id_0,
    input wand id_1,
    input supply0 id_2,
    input wand id_3,
    input tri0 id_4,
    output logic id_5,
    input uwire id_6,
    output tri1 id_7,
    input uwire id_8,
    output tri0 id_9,
    output uwire id_10,
    input tri id_11,
    input supply0 id_12,
    input tri0 id_13,
    input logic id_14,
    input tri id_15,
    output wand id_16
);
  reg id_18, id_19, id_20, id_21;
  wire id_22;
  module_0(
      id_20, id_22, id_20, id_19
  );
  always @(id_11 or posedge id_21 == id_2) begin
    id_18 <= #id_15 id_14;
    for (id_9 = id_3; 1'b0; id_9 = id_15) @(id_11);
  end
  always @(posedge 1'b0) id_5 = #1 1;
endmodule

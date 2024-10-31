// Seed: 3163143217
module module_0 (
    input wand id_0,
    output tri0 id_1,
    input uwire id_2,
    output wire id_3,
    output wand id_4,
    input tri1 id_5,
    input uwire id_6,
    output tri0 id_7,
    output supply0 id_8,
    inout supply0 id_9
);
  wire id_11;
endmodule
module module_1 (
    input tri1 id_0,
    output logic id_1,
    input tri id_2,
    input supply1 id_3,
    input wor id_4,
    input tri1 id_5,
    input wand id_6,
    input wire id_7,
    input tri1 id_8,
    input uwire id_9,
    input wand id_10,
    output tri1 id_11,
    input logic id_12,
    input wand id_13,
    input wor id_14,
    output tri1 id_15,
    inout supply1 id_16,
    input wire id_17,
    input tri1 id_18,
    output wire id_19,
    input tri1 id_20,
    input supply0 id_21,
    input tri0 id_22,
    input supply0 id_23,
    output uwire id_24,
    output wire id_25,
    input tri1 id_26,
    input wand id_27
    , id_30,
    output tri id_28
);
  wire id_31;
  wire id_32;
  wand id_33;
  supply0 id_34;
  module_0(
      id_33, id_19, id_26, id_33, id_15, id_33, id_16, id_24, id_24, id_16
  );
  wire id_35;
  wire id_36;
  wire id_37;
  wire id_38;
  always @(posedge !id_30 or posedge 1) begin
    if (id_18 == id_8) begin
      assume #1  (id_30) $display(id_33, id_5, id_33, 1, id_10);
      else $display(~id_10, id_26);
    end else begin
      id_1 <= 1;
      id_34 = 1'b0;
      id_30 <= id_12;
    end
  end
endmodule

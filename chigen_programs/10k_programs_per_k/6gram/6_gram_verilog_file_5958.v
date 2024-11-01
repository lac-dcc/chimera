// Seed: 3363103774
module module_0 (
    output logic id_0,
    input supply1 id_1,
    output supply0 id_2,
    input supply1 id_3,
    output supply1 id_4,
    input wire id_5,
    input wand id_6,
    input tri id_7,
    input wire id_8,
    input tri id_9,
    input tri1 id_10,
    output supply1 id_11,
    output wand id_12,
    input tri id_13,
    input logic id_14,
    input tri0 id_15,
    input uwire id_16,
    input wor id_17,
    input supply1 id_18,
    input wor id_19,
    output logic id_20,
    output wire id_21,
    input wire id_22,
    input wire id_23
);
  wire id_25, id_26, id_27, id_28, id_29, id_30, id_31, id_32, id_33, id_34 = id_25;
  wire id_35;
  always @(id_30) begin : id_36
    id_0 <= 'b0;
    begin
      if (1 || "") id_20 <= id_14;
      else $display;
    end
  end
endmodule
module module_1 (
    output logic id_0,
    output supply0 id_1,
    output tri id_2,
    output wand id_3,
    input wand id_4,
    output tri1 id_5,
    output wire id_6,
    output uwire id_7,
    input logic id_8,
    input logic id_9,
    input uwire id_10,
    output logic id_11,
    output logic id_12
);
  always @(posedge 1) begin
    id_6 = id_8 - 1;
    #1;
    release id_12;
    id_11 <= ((1'd0));
    if (1)
      if (id_10) id_12 <= 1;
      else id_0 <= id_8;
    $display(1'h0);
    begin
      id_11 <= 1;
      #(id_4) id_0 <= #1 id_9;
    end
    $display;
  end
  module_0(
      id_11,
      id_10,
      id_1,
      id_4,
      id_2,
      id_4,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_1,
      id_6,
      id_4,
      id_8,
      id_4,
      id_10,
      id_4,
      id_4,
      id_4,
      id_12,
      id_1,
      id_10,
      id_10
  );
endmodule

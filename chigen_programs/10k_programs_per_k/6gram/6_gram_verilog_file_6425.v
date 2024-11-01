// Seed: 3616703869
module module_0 (
    output tri id_0,
    input tri0 id_1,
    input tri0 id_2,
    output tri1 id_3,
    output uwire id_4,
    input tri1 id_5,
    output tri0 id_6,
    output supply1 id_7
);
  reg id_9 = 1;
  always @(posedge 1) begin
    $display;
  end
  wire id_10;
  wire id_11;
  always @(id_5) begin
    id_9 <= 1;
    id_0 = 1;
  end
endmodule
module module_1 (
    output logic id_0,
    output supply0 id_1,
    output logic id_2,
    output tri id_3,
    output supply1 id_4,
    output tri id_5,
    input uwire id_6,
    output supply0 id_7,
    input wor id_8,
    input logic id_9,
    input logic id_10,
    input wand id_11,
    input supply1 id_12,
    output logic id_13,
    output uwire id_14,
    input wor id_15,
    input supply1 id_16,
    input uwire id_17
);
  assign id_0 = id_10;
  wand id_19;
  assign id_19 = 1;
  module_0(
      id_4, id_6, id_6, id_5, id_1, id_6, id_4, id_14
  );
  always #1
    if (id_17) begin
      #1 id_2 = id_10;
    end else begin
      id_0 <= id_9;
      id_2 = (1 & 1);
    end
  always @(negedge id_11) begin
    id_13 <= id_9 / id_17;
  end
endmodule

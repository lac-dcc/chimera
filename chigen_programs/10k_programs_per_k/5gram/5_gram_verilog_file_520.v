// Seed: 2215060079
module module_0 (
    input tri0 id_0,
    output supply0 id_1,
    output uwire id_2,
    input wire id_3,
    output tri1 id_4,
    input wand id_5,
    input supply0 id_6,
    input tri1 id_7,
    output wire id_8,
    input tri1 id_9,
    input wire id_10,
    input wand id_11,
    output tri1 id_12,
    input wor id_13,
    output tri id_14,
    output supply1 id_15,
    output tri id_16,
    input wand id_17,
    output supply0 id_18,
    output uwire id_19,
    output uwire id_20,
    input uwire id_21,
    input wire id_22
);
  uwire id_24 = id_7;
  always @* #1;
  assign id_4 = 1;
  always @(*) begin
    id_4 = 1 | id_6 == "";
  end
  assign id_16 = id_3;
  generate
    always @(id_13 or posedge 1)
      if (1'b0 == id_13) begin
        disable id_25;
      end else begin
        id_12 = id_22;
      end
  endgenerate
endmodule
module module_1 (
    input wand id_0,
    output wand id_1,
    output tri id_2,
    input tri id_3,
    input supply0 id_4,
    output wor id_5,
    output tri id_6,
    output wor id_7,
    output supply1 id_8,
    output supply0 id_9,
    output wand id_10
);
  always_latch @(posedge id_3 or id_3) #1;
  module_0(
      id_0,
      id_7,
      id_1,
      id_0,
      id_7,
      id_3,
      id_4,
      id_0,
      id_10,
      id_0,
      id_3,
      id_0,
      id_6,
      id_3,
      id_8,
      id_9,
      id_10,
      id_3,
      id_5,
      id_1,
      id_10,
      id_3,
      id_4
  );
endmodule

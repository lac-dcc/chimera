// Seed: 1133204986
module module_0 (
    input uwire id_0,
    input wor id_1,
    input supply1 id_2,
    input supply1 id_3,
    output wor id_4,
    input tri1 id_5,
    input uwire id_6
);
  assign id_4 = 1;
endmodule
module module_1 (
    input logic id_0,
    output tri1 id_1,
    output logic id_2,
    input tri0 id_3,
    input uwire id_4,
    input tri1 id_5,
    output logic id_6,
    output wire id_7,
    output tri0 id_8,
    output tri0 id_9,
    input supply1 id_10
);
  always begin
    id_6 <= 1;
    if (1'b0) #1;
    else begin
      id_6 <= {id_0{id_8++}};
      if (1'b0) begin
        id_6 <= 1;
      end else id_2 <= 1;
    end
  end
  wire id_12;
  wire id_13, id_14, id_15, id_16, id_17, id_18, id_19;
  always_ff @(id_12) id_17 = id_15;
  module_0(
      id_4, id_10, id_4, id_5, id_1, id_3, id_4
  );
  wire id_20;
endmodule

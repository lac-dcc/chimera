// Seed: 3574738408
module module_0 (
    output logic id_0,
    output tri0 id_1,
    input wor id_2,
    output wand id_3,
    input wire id_4,
    input uwire id_5,
    input uwire id_6,
    input supply0 id_7,
    output wand id_8
);
  wire id_10;
  wire id_11;
  always_ff id_0 <= 1 - (1);
endmodule
module module_1 (
    input uwire id_0,
    input tri id_1,
    output wor id_2,
    output tri1 id_3,
    input uwire id_4,
    input tri1 id_5,
    input wor id_6,
    output supply1 id_7,
    output logic id_8,
    input tri1 id_9,
    input tri1 id_10,
    output logic id_11
);
  function id_13(input id_14);
  endfunction
  assign id_7 = id_1;
  wire id_15;
  wire id_16;
  module_0(
      id_13, id_2, id_10, id_3, id_1, id_1, id_5, id_4, id_3
  );
  wire id_17;
  initial begin
    id_8 <= 1 - 1;
  end
  reg id_18, id_19, id_20;
  always
    if (1) begin
      assert (1) begin
        id_11 = id_14;
      end
    end else begin
      id_19 <= 1;
      id_14 <= 1;
    end
  id_21(
      .id_0(id_8), .id_1(id_10), .id_2(id_20), .id_3(id_14), .id_4(1'h0)
  );
endmodule

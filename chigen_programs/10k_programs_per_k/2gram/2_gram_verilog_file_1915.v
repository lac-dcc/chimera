// Seed: 3729546441
module module_0 (
    input supply1 id_0,
    input wor id_1,
    input wire id_2,
    input wor id_3,
    input supply0 id_4
);
  supply0 id_6;
  supply1 id_7;
  assign id_6 = 1;
  assign id_7 = 1;
endmodule
module module_1 #(
    parameter id_6 = 32'd35,
    parameter id_7 = 32'd37
) (
    output logic id_0,
    input  tri   id_1,
    input  wire  id_2,
    output logic id_3,
    input  logic id_4
);
  assign id_0 = 1;
  module_0(
      id_2, id_2, id_2, id_1, id_2
  );
  always begin
    if (id_1) begin
      if (id_4) id_0 <= #1 1;
      begin
        if (1) begin
          force id_0 = 1 != 1;
        end
      end
    end
    id_3 <= id_4;
  end
  or (id_3, id_4, id_2, id_1);
  defparam id_6.id_7 = 1;
  wire id_8;
endmodule

// Seed: 1241037816
module module_0 (
    input supply1 id_0,
    output supply0 id_1,
    output tri0 id_2
);
  assign id_2 = id_0;
  always force id_2 = "" <= 1'd0;
endmodule
module module_1 (
    output logic   id_0,
    input  supply0 id_1,
    input  logic   id_2,
    input  logic   id_3,
    output supply1 id_4,
    output logic   id_5,
    output supply1 id_6
);
  initial begin
    if (~id_3) begin
      id_5 <= {1{1'b0}};
    end
  end
  module_0(
      id_1, id_4, id_6
  );
  assign id_4 = 1;
  assign id_5 = id_2;
  always id_0 = #1 id_3(1'b0 / 1, id_1);
endmodule

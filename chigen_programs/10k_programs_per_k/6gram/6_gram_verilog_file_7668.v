// Seed: 3153928764
module module_0 (
    input tri  id_0,
    input wand id_1,
    input wire id_2
);
  wire id_4;
  module_2();
endmodule
module module_1 (
    input tri1 id_0,
    input supply0 id_1,
    output supply1 id_2,
    output logic id_3,
    output uwire id_4,
    input logic id_5,
    output uwire id_6
);
  always
  fork : id_8
    id_9.id_10(1);
    #1;
    begin
      id_3 <= id_5;
    end
  join
  module_0(
      id_1, id_0, id_1
  );
endmodule
module module_2;
  reg id_2;
  always @(id_1 or negedge id_1) begin
    id_2 <= 1;
    wait (id_1);
  end
endmodule

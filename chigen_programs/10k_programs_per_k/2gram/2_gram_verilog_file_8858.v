// Seed: 842906124
module module_0 (
    id_1
);
  inout wire id_1;
  always begin
    id_1 <= 1'b0;
  end
  assign id_1 = id_1;
  wire id_2;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  always id_5 = new;
  always begin
    if (id_6) begin
      id_2 = id_7;
      fork
        if (1 - 1'b0) begin
          id_4 = id_3;
        end else @(*) #1 id_5 = 1;
        id_4 <= id_4;
        $display;
      join_any
    end
  end
  module_0(
      id_4
  ); id_9 :
  assert property (@(posedge 1) (id_6 == id_4))
  else;
endmodule

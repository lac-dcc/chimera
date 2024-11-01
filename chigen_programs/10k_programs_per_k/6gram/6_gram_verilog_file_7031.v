// Seed: 1509799547
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(posedge 1, negedge id_7) begin
    assume (1);
  end
  wire id_8;
  assign id_6 = 1;
  always @(posedge 1) begin
    if (1'b0) begin
      id_5 <= 1 ? id_4 : 1;
    end else id_4 = 1;
  end
endmodule
module module_1 (
    output logic id_0,
    output supply0 id_1,
    input supply1 id_2,
    output tri id_3
);
  reg id_5;
  always
  fork
    reg id_6;
    #1 id_6 = id_5;
    repeat (1'b0) id_0 <= id_6;
  join
  wire id_7;
  module_0(
      id_7, id_7, id_7, id_5, id_6, id_7, id_7
  );
endmodule

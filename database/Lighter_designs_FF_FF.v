// This program was cloned from: https://github.com/AUCOHL/Lighter
// License: Apache License 2.0

module FF(input clk,input d, output q );

 sky130_fd_sc_hd__dfxtp_4 x (
    .Q(qw)  ,
    .CLK(clk),
    .D(d)
);


 sky130_fd_sc_hd__inv_1 inv(
    .Y(q),
    .A(qw)
);

endmodule


